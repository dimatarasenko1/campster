class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    @campsite = Campsite.find(params[:campsite_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    authorize @booking
    @campsite = Campsite.find(params[:campsite_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.campsite = @campsite
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    authorize @booking
    @booking.delete
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
