require './tic_tac_toe'

describe TicTacToe do
  subject(:game) { described_class.new }

  describe '#get_names' do
    context 'get names from both players' do
      it 'changes player 1 name' do
        allow(game).to receive(:gets).and_return('Jerry')
        expect { game.get_names }.to change { game.instance_variable_get(:@player1) }.to('Jerry')
      end

      it 'changes player 2 name' do
        allow(game).to receive(:gets).and_return('Mogu')
        expect { game.get_names }.to change { game.instance_variable_get(:@player2) }.to('Mogu')
      end
    end
  end

  describe '#player_1_input' do
    context 'input between 1 and 9' do
      before do
        allow(game).to receive(:gets).and_return('1')
      end

      it 'returns input' do
        expect(game.player_1_input).to eq(1)
      end
    end
  end

  describe '#player_2_input' do
    context 'Invalid input then valid input between 1 and 9' do
      before do
        allow(game).to receive(:gets).and_return('a', '6')
      end

      it 'displays error once then complete loop' do
        expect(game).to receive(:puts).with('Position not available, please place your marker').once
        game.player_2_input
      end
    end
  end

  describe '#player_1_marker' do
    context 'get player 1 input' do
      it 'updates board' do
        expect { game.player_1_marker(1) }.to(change { game.instance_variable_get(:@board) })
      end
    end
  end

  describe '#player_2_marker' do
    context 'get player 2 input' do
      it 'updates board' do
        expect { game.player_2_marker(5) }.to(change { game.instance_variable_get(:@board) })
      end
    end
  end

  describe '#winner?' do
    context 'when player 1 has three matches in a row' do
      it 'returns true' do
        board = game.instance_variable_get(:@board)
        board[0][0], board[0][1], board[0][2] = 'X', 'X', 'X'
        expect(game.winner?).to be true
      end
    end

    context 'when player 2 has three matches in a row' do
      it 'returns true' do
        board = game.instance_variable_get(:@board)
        board[3][0], board[3][1], board[3][2] = 'O', 'O', 'O'
        expect(game.winner?).to be true
      end
    end

    context 'when player 1 has three matches in a column' do
      it 'returns true' do
        board = game.instance_variable_get(:@board)
        board[0][0] = 'X'
        board[2][0] = 'X'
        board[4][0] = 'X'
        expect(game.winner?).to be true
      end
    end

    context 'when player 2 has three diagonal matches' do
      it 'returns true' do
        board = game.instance_variable_get(:@board)
        board[0][0], board[2][1], board[4][2] = 'O', 'O', 'O'
        expect(game.winner?).to be true
      end
    end
  end

  describe '#draw?' do
    context 'when there is a draw' do
      it 'returns true' do
        board = game.instance_variable_get(:@board)
        board[0][0], board[0][1], board[0][2] = 'O', 'X', 'O'
        board[2][0], board[2][1], board[2][2] = 'O', 'X', 'X'
        board[4][0], board[4][1], board[4][2] = 'X', 'O', 'X'
        expect(game.draw?).to be true
      end
    end
  end
end
