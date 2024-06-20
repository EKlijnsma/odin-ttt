class Player
  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(options)
    while move = gets.chomp.to_i
        if options.include?(move)
            return move
        else
            puts "Invalid move!"
        end
    end
  end
end
