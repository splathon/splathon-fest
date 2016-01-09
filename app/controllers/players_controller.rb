class PlayersController < ApplicationController
  def create
    Player.create(player_params)
    redirect_to fest_playing_path(params[:fest_id])
  end

  private

  def player_params
    attributes = params.require(:player).permit(:name)
    attributes[:fest_id] = params[:fest_id]
    attributes
  end
end
