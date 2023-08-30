# class is an relationship, has-a relationship for module

# shorten methods
# object orient the code, private, etc
# Style guide
# end

# Player CLass
class TicTacToe
  def initialize
    puts 'Player 1 what is your name?'
    @player1 = gets.chomp
    puts 'Player 2 what is your name?'
    @player2 = gets.chomp
    @winner = false
    @draw = false
    @invalid_input = false
    @board = [
      ['1', '2', '3'],
      ['----------'],
      ['4', '5', '6'],
      ['----------'],
      ['7', '8', '9']
    ]
  end

  def self.welcome_message
    'Welcome to Tic Tac Toe!'
  end

  def play
    display_board()

    loop do
      p "Player 1: #{@player1}, where do you want to put your marker? (Enter a number)"

      loop do
        @invalid_input = false
        player_1_marker()
        break unless @invalid_input == "Position not available, please place your marker"
      end

      check_winner()
      display_board()

      if @winner == true
        puts "Congratulations #{@player1} won!"
        return
      end

      if draw?
        puts "It a draw!"
        return
      end

      p "Player 2: #{@player2}, where do you want to put your marker? (Enter a number)"

      loop do
        @invalid_input = false
        player_2_marker()
        break unless @invalid_input == "Position not available, please place your marker"
      end

      check_winner()
      display_board()

      if @winner == true
        puts "Congratulations #{@player2} won!"
        return
      end
    end
  end


  def display_board
    @board.each do |row|
      puts row.join(' | ')
    end
  end


  def player_1_marker
    input = gets.chomp.to_i
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
    else puts @invalid_input = "Position not available, please place your marker"
    end
  end 

  def player_2_marker
    input = gets.chomp.to_i
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
    else puts @invalid_input = "Position not available, please place your marker"
    end
  end

  def check_winner
    # Across
    @board.any? do |row|
      return @winner = true if row.all? {|value| value == 'X'}
      return @winner = true if row.all? {|value| value == 'O'}
    end

    #Columns
    if @board[0][0] == @board[2][0] && @board[2][0] == @board[4][0]
      return @winner = true if @board[0][0] == 'X'
      return @winner = true if @board[0][0] == 'O'
    end 
    if @board[0][1] == @board[2][1] && @board[2][1] == @board[4][1]
      return @winner = true if @board[0][1] == 'X'
      return @winner = true if @board[0][1] == 'O'
    end 
    if @board[0][2] == @board[2][2] && @board[2][2] == @board[4][2]
      return @winner = true if @board[0][2] == 'X'
      return @winner = true if @board[0][2] == 'O'
    end 

    #diagonal
    if @board[0][0] == @board[2][1] && @board[2][1] == @board[4][2]
      return @winner = true if @board[0][0] == 'X'
      return @winner = true if @board[0][0] == 'O'
    end 
    if @board[0][2] == @board[2][1] && @board[2][1] == @board[4][0]
      return @winner = true if @board[0][2] == 'X'
      return @winner = true if @board[0][2] == 'O'
    end 
  end
  def draw?
    @board.all? do |rows|
      rows.all? {|i| i == "X" || i == "O" || i =="----------"}
    end
  end

end

puts TicTacToe.welcome_message
game = TicTacToe.new
game.play