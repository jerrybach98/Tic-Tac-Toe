#Loop game
#Tic tac toe game, board is displayed between turns
#Classes? Board, player 1, player 2?
# instance variable is player name and selection?
#methods include adding positions to an array, winning conditions + patterns
# initializing the board, taking player input, checking for a win, and displaying the board.
#class is an relationship, has-a relationship for module


board = [['1', '2', '3'], ['----------'], ['4', '5', '6'], ['----------'], ['7', '8', '9']]


def display_board(board)
  board.each do |row|
    puts row.join(' | ')
  end
end

display_board(board)



class Player
  def initialize(name)
    @name = name
  end

  def welcome_message
    return "Hi #{@name}, welcome to tic tac toe"
  end
end


#loop do 
#use nested loop to print through board, display

#p.each do 

#get player name and input
#update game board
#check for win or draw
#switch players
#end 

jerry = Player.new "Jerry"
puts jerry.welcome_message