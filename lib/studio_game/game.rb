module StudioGame
  require_relative 'game_turn'
  require_relative 'treasure_trove'

  class Game
    attr_reader :title

    def initialize(title)
      @title = title
      @players = []
    end

    def load_players(from_file)
      File.readlines(from_file).each do |line|
        add_player(Player.from_csv(line))
      end
    end

    def add_player(player)
      @players << player
    end

    def print_name_and_stats(player_list)
      player_list.each do |player|
        puts "#{player.name} (#{player.health})"
      end
    end

    def print_player_strength(player_list)
      puts "\n#{player_list.length} strong players:"
    end

    def save_high_scores(file_name = "high_scores.txt")
      File.open(file_name, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player|
          file.puts high_score_entry(player)
        end
      end
    end

    def high_score_entry(player)
      "#{player.name.ljust(15, ".")}#{player.score}"
    end

    def print_stats
      sorted_players = @players.sort { |a, b| b.score <=> a.score}

      strong_players, wimpy_players = @players.partition {|player| player.strong?}

      print_player_strength(strong_players)
      print_name_and_stats(strong_players)

      print_player_strength(wimpy_players)
      print_name_and_stats(wimpy_players)


      @players.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end


      puts "\nKnuckleheads High Scores:"
      sorted_players.each do |player|
        puts high_score_entry(player)
      end

    end

    def play(rounds)
      puts "There are #{@players.size} players in #{@title}:\n\n"
      @players.each do |player|
        puts player
      end
      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.length} treasures to be found"
      treasures.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points"
      end

      1.upto(rounds) do |round|
        puts "\nRound #{round}:"

        @players.each do |player|
          GameTurn.take_turn(player)
          puts player
        end
      end
    end
  end
end
