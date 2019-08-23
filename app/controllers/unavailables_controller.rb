class UnavailablesController < ApplicationController
  before_action :load_campsite
  before_action :authenticate_user!

  def new
    @unavailable = Unavailable.new(campsite: @campsite)
    authorize @unavailable
  end

  def create
    dates = unavailable_params[:start_date].split(" to ")
    start_date = DateTime.parse(dates[0])
    end_date = DateTime.parse(dates[1])
    @unavailable = Unavailable.new(campsite: @campsite, start_date: start_date, end_date: end_date)
    authorize @unavailable
    if @unavailable.save
      redirect_to campsite_path(@campsite)
    else
      render :new
    end
  end

  private

  def load_campsite
    @campsite = Campsite.find(params[:campsite_id])
  end

  def unavailable_params
    params.require(:unavailable).permit(:start_date)
  end
end
