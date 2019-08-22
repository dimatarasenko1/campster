class ReviewsController < ApplicationController
  before_action :set_booking

  def index
    @review = policy_scope(Review)
  end

  def show
    authorize @review
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review
  end

  def create
    @review = Review.new(strong_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to user_bookings_path(current_user)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def strong_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
