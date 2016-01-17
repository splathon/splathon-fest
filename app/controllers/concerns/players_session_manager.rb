# frozen_string_literal: true
module PlayersSessionManager
  extend ActiveSupport::Concern

  SESSION_COOKIE_KEY = 'fest_players_session'

  def players_session
    PlayersSession.new(players: cookies.signed[SESSION_COOKIE_KEY])
  end

  def update_players_session(new_session)
    cookies.signed[SESSION_COOKIE_KEY] = new_session.cookie
  end
end
