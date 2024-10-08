# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#make_move' do
    # Set up the subject and an options array for use in all cases
    subject(:player) { described_class.new('X') }
    let(:options) { [1, 2, 3, 4, 5] }

    context 'when a valid move is made' do
      before do
        allow(player).to receive(:gets).and_return('2')
      end

      it 'returns the move' do
        move = player.make_move(options)
        expect(move).to eq(2)
      end
    end

    context 'when an invalid move is made once' do
      before do
        allow(player).to receive(:gets).and_return('9', '2')
      end
      it 'returns a message once and then returns the valid move' do
        expect(player).to receive(:puts).once
        move = player.make_move(options)
        expect(move).to eq(2)
      end
    end

    context 'when an invalid move is made twice' do
      before do
        allow(player).to receive(:gets).and_return('9', '8', '2')
      end
      it 'returns a message twice and then returns the valid move' do
        expect(player).to receive(:puts).twice
        move = player.make_move(options)
        expect(move).to eq(2)
      end
    end
  end
end
