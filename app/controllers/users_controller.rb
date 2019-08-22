class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @my_bookings = current_user.bookings
    @user = User.find(params[:id])
    authorize @user
  end
end
