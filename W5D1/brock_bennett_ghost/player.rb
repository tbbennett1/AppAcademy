
class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def guess
        puts "#{@name}, Please enter in a char: "
        guess_char = gets.chomp 
    end

    # def alert_invalid_guess
    # end


end