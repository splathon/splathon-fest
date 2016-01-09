class PlayersSession
  include Virtus.model

  attribute :players, Hash[Integer => Integer]

  def [](fest)
    case fest
    when Integer
      return Player.find_by(id: players[fest])
    when Fest
      return Player.find_by(id: players[fest.id])
    else
      return nil
    end
  end

  def []=(fest, player)
    players[fest.id.to_i] = player.id.to_i
  end

  def players=(players)
    players = JSON.parse(players) if players.is_a?(String)
    super players
    case self.players
    when Hash
    else
      self.players = {}
    end
  end

  def cookie
    players.to_json
  end
end
