class TicTacToe
  def initialize
    # Game state variables
    @player1 = nil
    @player2 = nil
    @board = [
      ['1', '2', '3'],
      ['----------'],
      ['4', '5', '6'],
      ['----------'],
      ['7', '8', '9']
    ]
  end

  # Looping Script method
  def play
    get_names
    display_board

    loop do
      # Player 1 logic
      player_input = player_1_input
      player_1_marker(player_input)
      display_board
      if winner?
        puts "Congratulations #{@player1} won!"
        return
      end
      if draw?
        puts 'It a draw!'
        return
      end

      # Player 2 game logic
      second_input = player_2_input
      player_2_marker(second_input)
      display_board
      if winner?
        puts "Congratulations #{@player2} won!"
        return
      end
    end
  end

  private

  def get_names
    puts 'Welcome to Tic Tac Toe!'
    puts 'Player 1 what is your name?'
    @player1 = gets.chomp
    puts 'Player 2 what is your name?'
    @player2 = gets.chomp
  end

  def display_board
    @board.each do |row|
      puts row.join(' | ')
    end
  end

  def player_1_input
    p "Player 1: #{@player1}, where do you want to put your marker? (Enter a number)"

    loop do
      input = gets.chomp.to_i
      return input if input.between?(1, 9)

      puts 'Position not available, please place your marker'
    end

    input
  end

  def player_1_marker(input)
    if input == 1 && @board[0][0] == '1'
      @board[0][0] = 'X'
    elsif input == 2 && @board[0][1] == '2'
      @board[0][1] = 'X'
    elsif input == 3 && @board[0][2] == '3'
      @board[0][2] = 'X'
    elsif input == 4 && @board[2][0] == '4'
      @board[2][0] = 'X'
    elsif input == 5 && @board[2][1] == '5'
      @board[2][1] = 'X'
    elsif input == 6 && @board[2][2] == '6'
      @board[2][2] = 'X'
    elsif input == 7 && @board[4][0] == '7'
      @board[4][0] = 'X'
    elsif input == 8 && @board[4][1] == '8'
      @board[4][1] = 'X'
    elsif input == 9 && @board[4][2] == '9'
      @board[4][2] = 'X'
    end
  end

  def player_2_input
    p "Player 2: #{@player2}, where do you want to put your marker? (Enter a number)"

    loop do
      input = gets.chomp.to_i
      return input if input.between?(1, 9)

      puts 'Position not available, please place your marker'
    end
    input
  end

  def player_2_marker(input)
    if input == 1 && @board[0][0] == '1'
      @board[0][0] = 'O'
    elsif input == 2 && @board[0][1] == '2'
      @board[0][1] = 'O'
    elsif input == 3 && @board[0][2] == '3'
      @board[0][2] = 'O'
    elsif input == 4 && @board[2][0] == '4'
      @board[2][0] = 'O'
    elsif input == 5 && @board[2][1] == '5'
      @board[2][1] = 'O'
    elsif input == 6 && @board[2][2] == '6'
      @board[2][2] = 'O'
    elsif input == 7 && @board[4][0] == '7'
      @board[4][0] = 'O'
    elsif input == 8 && @board[4][1] == '8'
      @board[4][1] = 'O'
    elsif input == 9 && @board[4][2] == '9'
      @board[4][2] = 'O'
    end
  end

  def winner?
    # Across
    @board.any? do |row|
      return true if row.all? { |value| value == 'X' }
      return true if row.all? { |value| value == 'O' }
    end

    # Columns
    if @board[0][0] == @board[2][0] && @board[2][0] == @board[4][0]
      return true if @board[0][0] == 'X'
      return true if @board[0][0] == 'O'
    end
    if @board[0][1] == @board[2][1] && @board[2][1] == @board[4][1]
      return true if @board[0][1] == 'X'
      return true if @board[0][1] == 'O'
    end
    if @board[0][2] == @board[2][2] && @board[2][2] == @board[4][2]
      return true if @board[0][2] == 'X'
      return true if @board[0][2] == 'O'
    end

    # Diagonal
    if @board[0][0] == @board[2][1] && @board[2][1] == @board[4][2]
      return true if @board[0][0] == 'X'
      return true if @board[0][0] == 'O'
    end
    if @board[0][2] == @board[2][1] && @board[2][1] == @board[4][0]
      return true if @board[0][2] == 'X'
      return true if @board[0][2] == 'O'
    end

    false
  end

  def draw?
    @board.all? do |rows|
      rows.all? { |i| ['X', 'O', '----------'].include?(i) }
    end
  end
end

game = TicTacToe.new
game.play
