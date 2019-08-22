class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @my_bookings = current_user.bookings
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to
      user_path(@user)
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
