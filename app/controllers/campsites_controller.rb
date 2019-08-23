class CampsitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    authorize Campsite
    @campsites = nil
    if params_exist?
      query_params = params[:query]
      if params_include_address?
        address = query_params["campsite-address"]
        @campsites = policy_scope(Campsite).near(address, 100)
        @campsites ||= general_location_search
      end
      if params_include_dates?
        dates = query_params["date-field"].split(" to ")
        start_date = DateTime.parse(dates[0])
        end_date = DateTime.parse(dates[1])
        search_dates = (start_date..end_date).to_a
        @campsites ||= general_location_search
        @campsites = Campsite.search(@campsites, search_dates)
      end
      @campsites ||= general_location_search
    else
      @campsites = general_location_search
    end
    @campsites = @campsites.geocoded # returns campsites with coordinates
    @markers = @campsites.map do |campsite|
      {
        lat: campsite.latitude,
        lng: campsite.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { campsite: campsite }),
        image_url: helpers.asset_url('favicon.png')
      }
    end
  end

  def new
    @campsite = Campsite.new
    authorize @campsite
  end

  def show
    @campsite = Campsite.find(params[:id])
    authorize @campsite
    @review = Review.new
  end

  def create
    @campsite = Campsite.new(campsite_params)
    authorize @campsite
    @campsite.user = current_user
    if @campsite.valid?
      @campsite.save
      redirect_to campsite_path(@campsite)
    else
      render :new
    end
  end

  def edit
    @campsite = Campsite.find(params[:id])
    authorize @campsite
    render :new
  end

  def update
    @campsite = Campsite.find(params[:id])
    authorize @campsite
    if @campsite.update(campsite_params)
      redirect_to campsite_path(@campsite)
    else
      render :new
    end
  end

  def destroy
    @campsite = Campsite.find(params[:id])
    @campsite.destroy
    redirect_to campsites_path
  end

  private

  def campsite_params
    params.require(:campsite).permit(:title,
                                     :description,
                                     :price_per_night,
                                     :address,
                                     :postcode,
                                     :city,
                                     :country,
                                     :max_guests,
                                     :amenities,
                                     :photo)
  end

  def general_location_search
    policy_scope(Campsite).near("United Kingdom", 1000)
  end

  def params_exist?
    params[:query]
  end

  def params_include_address?
    params[:query]["campsite-address"] != ""
  end

  def params_include_dates?
    params[:query]["date-field"] != ""
  end
end
