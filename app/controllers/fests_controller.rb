class FestsController < ApplicationController
  def index
    @fests = Fest.all
  end

  def create
    @fest = Fest.new(fest_params)
    if @fest.save
      redirect_to fests_path
    else
      @fests = Fest.all
      render :index
    end
  end

  def show
    @fest = Fest.find(params[:id])
    gon.fest = @fest
  end

  private

  def fest_params
    params.require(:fest).permit(:name)
  end
end
