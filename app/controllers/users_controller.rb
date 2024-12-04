class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update_status
    @home = Home.find(params[:id])
    @user_home = UserHome.find_or_create_by(user: current_user, home: @home)
  
    new_status = params[:status]
  
    if new_status == '入場中'
      @user_home.update(status: '入場中')
    elsif new_status == '退場中'
      @user_home.update(status: '退場中')
    end
  
    redirect_to home_path(@home)
  end
end
