class WorksController < ApplicationController

  def new
    @works = Work.all
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:notice] = '正しく登録されました！' 
      redirect_to new_work_path
    else 
      render :new
    end
  end

  def destroy
    @work = Work.find(params[:id])
    if @work.destroy
      redirect_to work_path
    end
  end

  private

  def work_params
    params.require(:work).permit(:work)
  end
end
