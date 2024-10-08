# frozen_string_literal: true

# A Player has a symbol (X or O) and can make a move
class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def make_move(options)
    while (move = gets.chomp.to_i)
      return move if options.include?(move)

      puts 'Invalid move!'

    end
  end

  def to_s
    "Player #{symbol}"
  end
end
