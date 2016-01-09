module PlayerAuthorizer
  extend ActiveSupport::Concern
  include PlayersSessionManager

  def current_fest
    @fest
  end

  def current_player
    @current_player ||= players_session[current_fest]
  end

  def login(player)
    new_players_session = players_session
    new_players_session[player.fest] = player
    update_players_session(new_players_session)
  end
end
