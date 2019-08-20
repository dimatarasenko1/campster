class BookingsController < ApplicationController
  before_action :authenticate_user! # => Any action to do with bookings has to be authenticated
  def new
    # @booking = build_booking_from_params
    # if @booking.valid?
    #   # actually show the confirmation page
    #   render :new
    # else
    #   # back to where you came from
    #   redirect_to campsite_path(@campsite)
    # end
    @campsite = Campsite.find(params[:campsite_id])
    @booking = Booking.new(campsite: @campsite)
    authorize @booking
  end

  def create
    # @booking = build_booking_from_params
    # if @booking.valid?
    #   @booking.save
    #   redirect_to user_path(current_user)
    # else
    #   render :new
    # end
    @campsite = Campsite.find(params[:campsite_id])
    @booking = Booking.new(campsite: @campsite)
    authorize @booking
    @booking.save
    redirect_to campsite_path(@campsite)
  end

  def index
    @bookings = policy_scope(Booking)
  end

  private

  def load_campsite
    @campsite = Campsite.find(params[:campsite_id])
  end

  def booking_params
    # params.permit(:booking_params).require("start_date(3i)", "start_date(2i)",
    #                                        "start_date(1i)", "guests")
    params.require(:campsite_id)
  end

  def build_booking_from_params
    load_campsite
    query_params = booking_params
    guests = query_params['guests']
    start_date = Date.new(query_params["start_date(1i)"].to_i,
                          query_params["start_date(2i)"].to_i,
                          query_params["start_date(3i)"].to_i)
    end_date = Date.new(query_params["end_date(1i)"].to_i,
                        query_params["end_date(2i)"].to_i,
                        query_params["end_date(3i)"].to_i)
    total_price = @campsite.price_per_night.to_i * (end_date - start_date)
    @booking = Booking.new(start_date: start_date, end_date: end_date,
                           total_price: total_price, guests: guests,
                           campsite_id: @campsite, user_id: current_user,
                           status: 'pending')
  end
end
