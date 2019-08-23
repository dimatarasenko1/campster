class CampsitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    authorize Campsite
    if params[:query] && params[:query]["campsite-address"] != ""
      query_params = params[:query]
      dates = query_params["date-field"].split(" to ")
      start_date = Date.parse(dates[0])
      end_date = Date.parse(dates[1])
      search_dates = (start_date..end_date).to_a
      address = query_params["campsite-address"]
      @campsites = Campsite.near(address, 100)

      @campsites = Campsite.near(address, 100).joins(:unavailables, :bookings)
                           .where("unavailables.start_date < ?", start_date)
                           .where("unavailables.end_date > ?", end_date)
                           .where("bookings.start_date < ?", start_date)
                           .where("bookings.end_date > ?", end_date)
      # @campsites = @campsites.joins(:bookings).joins(:unavailables).where(sql_query, {start: start_date, end: end_date})
      # raise
      # @campsites = policy_scope(Campsite)
      skip_policy_scope
    else
      @campsites = policy_scope(Campsite)
    end
    @campsites = @campsites.geocoded # returns campsites with coordinates
    @markers = @campsites.map do |campsite|
      {
        lat: campsite.latitude,
        lng: campsite.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { campsite: campsite }),
        image_url: helpers.asset_url('black_pointer.png')
      }
    end
    # at this point campsites should be an array of suitable objects ready for view.
    # the search method is moved to model so we can add complexity.
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
end
