class CampsitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    authorize Campsite
    if params_exist?
      query_params = params[:query]
      dates = query_params["date-field"].split(" to ")
      start_date = DateTime.parse(dates[0])
      end_date = DateTime.parse(dates[1])
      search_dates = (start_date..end_date).to_a
      address = query_params["campsite-address"]
      @campsites = policy_scope(Campsite).near(address, 100)
      @campsites = Campsite.search(@campsites, search_dates)
    else
      @campsites = policy_scope(Campsite)
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

  def params_exist?
    params[:query] && params[:query]["campsite-address"] != "" && params[:query]["date-field"] != ""
  end
end
