class CampsitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    authorize Campsite
    if !params[:query].nil?
      query_params = params[:query]
      location = query_params["location"]
      start_date = Date.new(query_params["start_date(1i)"].to_i,
                            query_params["start_date(2i)"].to_i,
                            query_params["start_date(3i)"].to_i)
      end_date = Date.new(query_params["end_date(1i)"].to_i,
                          query_params["end_date(2i)"].to_i,
                          query_params["end_date(3i)"].to_i)
      @campsites = Campsite.search(location: location,
                                   start_date: start_date,
                                   end_date: end_date)
    else
      @campsites = policy_scope(Campsite)
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
                                     :amenities)
  end
end
