# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'

describe Game do
  let(:playerX) { instance_double(Player, symbol: 'X') }
  let(:playerO) { instance_double(Player, symbol: 'O') }
  let(:board) { instance_double(Board) }
  subject(:game) { described_class.new(playerX, playerO, board) }

  describe '#options' do
    it 'returns all 9 options when the board is empty' do
      allow(board).to receive(:state).and_return([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
      expect(game.options.length).to eq(9)
    end
    it 'returns limited options when the board is partially full' do
      allow(board).to receive(:state).and_return([[1, 2, 3], [4, 5, 'X'], %w[X O O]])
      expect(game.options.length).to eq(5)
    end
    it 'returns an empty array when the board is full' do
      allow(board).to receive(:state).and_return([%w[O X O], %w[X X O], %w[O X X]])
      expect(game.options.length).to eq(0)
    end
  end

  describe '#switch_players' do
    it 'switches from player X to player O' do
      expect(game.switch_players(playerX)).to eq(playerO)
    end
    it 'switches from player O to player X' do
      expect(game.switch_players(playerO)).to eq(playerX)
    end
  end
end
