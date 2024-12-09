class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @home = Home.includes(:user)
    
    @addresses = Address.all # 検索用のプルダウンに表示するための住所一覧
    if params[:address_id].present?
      @homes = Home.where(address_id: params[:address_id])
    else
      @homes = Home.all
    end
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

  def show
    @home = Home.find(params[:id])
    @user = current_user  # ログイン中のユーザーを取得
    
    # 現在「入場中」のユーザーを取得
    @users_in_home = UserHome.where(home: @home).order(entry_time: :asc)
  end

  def edit
    @home = Home.find(params[:id])
    unless @home.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @home = Home.find(params[:id])
    if @home.update(home_params)
      redirect_to home_path
    else
      render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    if @home.destroy
      redirect_to root_path
    end
  end

  private
  def home_params
    params.require(:home).permit(:title, :address_id, :supervisor_id).merge(user_id: current_user.id)
  end

end