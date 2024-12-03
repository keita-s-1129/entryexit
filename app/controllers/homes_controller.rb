class HomesController < ApplicationController

  def index
    @home = Home.includes(:user)
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)
    if @home.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def home_params
    params.require(:home).permit(:title, :address_id, :supervisor_id).merge(user_id: current_user.id)
  end

end
