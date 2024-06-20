# frozen_string_literal: true

# A game contains a board that is regularly updated and 2 players
# The game can be played, it can announce who is next, process a move, change who's turn it is
# Switch players, and announce a winner
class Game
  attr_accessor :board
  attr_reader :player1, :player2

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    self.board = board
  end

  def starting_player
    [player1, player2].sample
  end

  def options
    board.state.flatten.select { |cell| cell >= 1 && cell <= 9 }
  end

  def switch_players(player)
    if player == player1
      player2
    else
      player1
    end
  end

  def play
    current_player = starting_player
    loop do
      puts board
      next_move = current_player.make_move(options)
      self.board = board.process_move(next_move, current_player.symbol)
      if board.winner?
        puts "Congratulations #{current_player}, you won!"
        break
      elsif options.empty?
        puts 'Game over, its a tie!'
        break
      else
        switch_players(current_player)
      end
    end
  end
end
