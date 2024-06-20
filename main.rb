# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

board = Board.new
player_x = Player.new('X')
player_o = Player.new('O')
game = Game.new(player_x, player_o, board)

game.play
