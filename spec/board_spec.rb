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
      xit 'correctly returns no win' do
      end
      xit 'detects a vertical win' do
      end
      xit 'detects a horizontal win' do
      end
      xit 'detects a diagonal win' do
      end
    end
    
    context 'when the board is full' do
      xit 'correctly returns no win' do
      end
      xit 'detects a vertical win' do
      end
      xit 'detects a horizontal win' do
      end
      xit 'detects a diagonal win' do
      end
    end

  end
end