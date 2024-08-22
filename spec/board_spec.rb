# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }
  describe '#process_move' do

  end
  
  describe '#winner?' do
    context 'when the board is empty' do
      it 'does not detect a win' do
        expect(board).not_to be_winner
      end
    end
    
    context 'when the board is partially occupied' do
      it 'correctly returns no win' do
        board.state = [[1, 'X', 3], ['X', 'O', 6], [7, 'O', 9]]
        expect(board).not_to be_winner
      end
      it 'detects a vertical win' do
        board.state = [['X', 'O', 3], ['X', 'O', 6], [7, 'O', 'X']]
        expect(board).to be_winner
      end
      it 'detects a horizontal win' do
        board.state = [[1, 'X', 3], ['X', 'O', 'X'], ['O', 'O', 'O']]
        expect(board).to be_winner
      end
      it 'detects a diagonal win' do
        board.state = [['X', 2, 3], ['O', 'X', 6], [7, 'O', 'X']]
        expect(board).to be_winner
      end
    end
    
    context 'when the board is full' do
      it 'correctly returns no win' do
        board.state = [['O', 'X', 'O'], ['X', 'X', 'O'], ['X', 'O', 'X']]
        expect(board).not_to be_winner
      end
      it 'detects a vertical win' do
        board.state = [['O', 'X', 'O'], ['X', 'X', 'O'], ['O', 'X', 'X']]
        expect(board).to be_winner
      end
      it 'detects a horizontal win' do
        board.state = [['O', 'X', 'O'], ['X', 'X', 'X'], ['X', 'O', 'O']]
        expect(board).to be_winner
      end
      it 'detects a diagonal win' do
        board.state = [['X', 'X', 'O'], ['O', 'X', 'O'], ['X', 'O', 'X']]
        expect(board).to be_winner
      end
    end

  end
end