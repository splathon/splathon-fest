class FestChannel < ApplicationCable::Channel
  def subscribed
    stream_for params[:fest_id]
  end
end
