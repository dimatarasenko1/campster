class ReviewsController < ApplicationController
  before_action :set_booking

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(strong_params)
    if @review.save
      redirect_to campsite_path(@campsite)
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
