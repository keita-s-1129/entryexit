class SupervisorsController < ApplicationController

  def new
    @supervisor = Supervisor.new
  end

  def create
    @supervisor = Supervisor.new(supervisor_params)
    if @supervisor.save
      flash[:notice] = '正しく登録されました！' 
      redirect_to new_supervisor_path
    else 
      render :new
    end
  end

  private

  def supervisor_params
    params.require(:supervisor).permit(:supervisor)
  end
end
