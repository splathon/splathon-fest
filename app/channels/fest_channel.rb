class FestChannel < ApplicationCable::Channel
  def subscribed
    stream_for params[:fest_id]
  end

  def vote(data)
    fest_id = params[:fest_id]
    theme_id = data['theme']
    player = current_session[fest_id]

    Vote.create!(theme_id: theme_id, player: player, side: data['side'])
    ActionCable.server.broadcast(
      "fest:#{fest_id}",
      event: 'vote',
      alpha: vote_count(theme_id, 'alpha'),
      bravo: vote_count(theme_id, 'bravo'))
  end

  private

  def vote_count(theme_id, side)
    Vote
      .where(theme_id: theme_id, side: side)
      .count
  end
end
