require_relative 'player'

class Ghost
    attr_reader :current_player
    Ghost = "GHOST"
    Alpha = ("a".. "z").to_a
    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
        @current_player = @player_1
        @previous_player = @player_2
        @fragment = ""
        words = File.readlines('dictionary.txt').map(&:chomp)
        @dictionary = Hash.new(false)
        words.each { |word| @dictionary[word] = true}
        @losses = { @player_1 => 0, @player_2 => 0}
    end
    
    def valid_play?(char)
        if !Alpha.include?(char)
            raise
        end
        @dictionary.each_key do |k|
            return true if k.include?(@fragment+char)
        end
        false
    end

    def next_player!
        if @current_player == @player_1
            @previous_player = @player_1
            @current_player = @player_2
        else
            @previous_player = @player_2
            @current_player = @player_1
        end
    end

    def take_turn(player)
        guess_char = player.guess
        if self.valid_play?(guess_char)
            @fragment += guess_char
            puts "Current fragment is: #{@fragment}"
            self.next_player!
        else
            puts "invalid play"
            take_turn(player)
        end
    end

    #define play round, take turns until @fragment is found in hash
    #keep count of score?
    def play_round
        until @dictionary[@fragment] 
            self.take_turn(@current_player)  
        end
        @losses[@previous_player] += 1

        puts "Round winner is #{@current_player.name}"
        puts "#{@current_player.name} has #{Ghost[0...@losses[@current_player]]} "
        puts "#{@previous_player.name} has #{Ghost[0...@losses[@previous_player]]} "
    end

    def play_game
        until @losses[@current_player] == 5 || @losses[@previous_player] == 5
            self.play_round
            @fragment = ""
        end
        puts "Game over"
    end


end

bob = Player.new("bob")
alice = Player.new("alice")
game_1 = Ghost.new(bob, alice)
game_1.play_game
