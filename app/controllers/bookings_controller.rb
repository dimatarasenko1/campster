class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_campsite, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def new
    parameters = params[:query]
    dates = parameters[:dates].split(" to ")
    guests = parameters[:guests].to_i
    start_date = Date.parse(dates[0])
    end_date = Date.parse(dates[1])
    booking_attributes = { campsite: @campsite, user: current_user,
                           guests: guests, start_date: start_date,
                           end_date: end_date }
    @booking = Booking.new(booking_attributes)
    authorize @booking
  end

  def create
    @campsite = Campsite.find(params[:campsite_id])
    @booking = Booking.new(booking_params)
    @booking.campsite = @campsite
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to user_bookings_path(current_user)
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
    params.require(:booking).permit(:start_date, :end_date, :guests)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_campsite
    @campsite = Campsite.find(params[:campsite_id])
  end
end
