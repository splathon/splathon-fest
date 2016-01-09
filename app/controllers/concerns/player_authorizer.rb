module PlayerAuthorizer
  extend ActiveSupport::Concern

  def current_fest
    @fest
  end

  def current_player
    return @current_player if @current_player

    logged_ins = logged_ins_from_session
    @current_player =
       Player.find_by(id: logged_ins[current_fest.id.to_s], fest: current_fest)
  end

  def login(player)
    logged_ins = logged_ins_from_session
    logged_ins[player.fest.id] = player.id
    session[:logged_ins] = logged_ins
  end

  private

  def logged_ins_from_session
    session[:logged_ins] || {}
  end
end
