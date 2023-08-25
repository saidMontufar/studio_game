module StudioGame
  require_relative 'die'
  require_relative 'player'


  module GameTurn

    def self.take_turn(player)
      die = Die.new
      case die.roll
      when 1..2
        player.blam
      when 5..6
        player.w00t
      else
        "#{player.name} was skipped"
      end

      treasure = TreasureTrove.random
      player.found_treasure(treasure)
    end
  end
end
