#Loop game
#Tic tac toe game, board is displayed between turns
#Classes? Board, player 1, player 2?
# instance variable is player name and selection?
#methods include adding positions to an array, winning conditions + patterns
# initializing the board, taking player input, checking for a win, and displaying the board.
#class is an relationship, has-a relationship for module
# Work on logic to take each player input and fill board

#loop do
#update game board
#check for win or draw
#switch players
#end 

# Player CLass
class Tic_Tac_Toe


  def initialize()
    puts "Player 1 what is your name?"
    @player_1 = gets.chomp
    puts "Player 2 what is your name?"
    @player_2 = gets.chomp

  end

  def self.welcome_message
    return "Welcome to tic tac toe!"
  end

  def play 
    board = [
      ['1', '2', '3'], 
      ['----------'], 
      ['4', '5', '6'], 
      ['----------'], 
      ['7', '8', '9']
    ]
    def display_board(board)
      board.each do |row|
        puts row.join(' | ')
      end
    end
    display_board(board)
    
    p "Player 1 - #{@player_1}: Where do you want to put your marker? (Enter a number)"
    input = gets.chomp.to_i
      if input == 1
        board[0][0] = 'X'
      elsif input == 2 
        board[0][1] = 'X'
      elsif input == 3
        board[0][2] = 'X'
      elsif input == 4
        board[2][0] = 'X'
      elsif input == 5
        board[2][1] = 'X'
      elsif input == 6
        board[2][2] = 'X'
      elsif input == 7
        board[4][0] = 'X'
      elsif input == 8
        board[4][1] = 'X'
      elsif input == 9
        board[4][2] = 'X'
      end
    display_board(board)


    p "Player 2: Where do you want to put your marker? (Enter a number)"
    second_input = gets.chomp.to_i
    if second_input == 1
      board[0][0] = 'O'
    elsif second_input == 2 
      board[0][1] = 'O'
    elsif second_input == 3
      board[0][2] = 'O'
    elsif second_input == 4
      board[2][0] = 'O'
    elsif second_input == 5
      board[2][1] = 'O'
    elsif second_input == 6
      board[2][2] = 'O'
    elsif second_input == 7
      board[4][0] = 'O'
    elsif second_input == 8
      board[4][1] = 'O'
    elsif second_input == 9
      board[4][2] = 'O'
    end
    display_board(board)

  end 
  
end

puts Tic_Tac_Toe.welcome_message
game = Tic_Tac_Toe.new
game.play