class PlayingsController < ApplicationController
  include PlayerAuthorizer

  def show
    @fest = Fest.find_by(id: params[:fest_id], status: 'opened')
    raise ActiveRecord::RecordNotFound unless @fest
    redirect_to fest_playing_player_signup_path(@fest) unless current_player
  end
end
