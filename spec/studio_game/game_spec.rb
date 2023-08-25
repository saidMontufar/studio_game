module StudioGame
  require 'studio_game/game'

  describe Game do
    before do
      @game = Game.new("Knuckleheads")

      @initial_health = 100
      @player = Player.new("moe", @initial_health)

      @game.add_player(@player)
    end

    it "When die rolls a high number (5..6) twice" do

      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(2)
      expect(@player.health).to eq(@initial_health + (15 * 2))
    end

    it "When die rolls a medium number (3..4)" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      @game.play(2)
      expect(@player.health).to eq(@initial_health)
    end

    it "When die rolls a low number (1..2)" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(2)
      expect(@player.health).to eq(@initial_health - (10 * 2))
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new("Knuckleheads")
      player = Player.new("moe")
      game.add_player(player)
      game.play(1)

      expect(player.points).not_to be_zero
    end
  end
end
