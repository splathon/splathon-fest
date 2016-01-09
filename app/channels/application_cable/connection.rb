# Be sure to restart your server when you modify this file.
# Action Cable runs in an EventMachine loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include PlayersSessionManager

    identified_by :current_session

    def connect
      self.current_session = players_session
    end
  end
end
