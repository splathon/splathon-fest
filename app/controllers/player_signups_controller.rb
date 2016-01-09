class PlayerSignupsController < ApplicationController
  include PlayerAuthorizer

  def show
    @fest = Fest.find(params[:fest_id])
  end

  def create
    @player = Player.new(signup_params)
    if @player.save
      login(@player)
      redirect_to fest_playing_path(@player.fest)
    elsif @fest = Fest.find(params[:fest_id])
      render 'show'
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  private

  def signup_params
    attributes = params.require(:player).permit(:name)
    attributes[:fest_id] = params[:fest_id]
    attributes
  end
end
