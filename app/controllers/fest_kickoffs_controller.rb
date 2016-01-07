class FestKickoffsController < ApplicationController
  def create
    @fest_kickoff = FestKickoff.new(fest_kickoff_params)
    if @fest_kickoff.save
      redirect_to fest_path(@fest_kickoff.fest)
    elsif @fest_kickoff.fest
      redirect_to fest_path(@fest_kickoff.fest)
    else
      redirect_to fests_path
    end
  end

  private

  def fest_kickoff_params
    params.permit(:fest_id).to_h
  end
end
