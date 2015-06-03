


# 1. Draw a board

# assign player "X"
# assign computer "O"


# loop until a winner or all squares are taken
# 2. player1 pick a empty square
# 3. computer pick a empty square
# 4. check for winner

# if there is winner show the winner else its tie


def initialize_board
  squares = {}
  (1..9).each { |position| squares[position] = ' ' }
  squares
end

def draw_board(squares)
  system 'clear'
  puts "  #{squares[1]} | #{squares[2]}  | #{squares[3]}  "
  puts "----+----+-----"
  puts "  #{squares[4]} | #{squares[5]}  | #{squares[6]}  "
  puts "----+----+-----"
  puts "  #{squares[7]} | #{squares[8]}  | #{squares[9]}  "
end

def empty_position(squares)
  squares.select { |k,v| v == ' ' }.keys
end

def empty?(squares, space)
  empties = empty_position(squares)
  empties.include?(space)
end

# def player_picks_square(squares)
#   puts "Pick a square (1 - 9)"
#   position = gets.chomp.to_i
#   until empty?(squares, position)
#   puts "Place is taken, choose a free space?"
#   position = gets.chomp.to_i
#   end
#   squares[position] = 'x'
# end

def player_picks_square(squares)
  puts "Pick a square (1 - 9)"
  position = gets.chomp.to_i
  until empty?(squares, position)
  puts "Place is taken, choose a free space?"
  position = gets.chomp.to_i
  end
  squares[position] = 'x'
end


def computer_picks_square(squares)
  sleep 0.5
  position = empty_position(squares).sample
  squares[position] = 'o'
end

WINNER_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) ==
    hsh.select { |k,v| v == '  '}.keys.first
  else
    false
  end
end

def check_winner(squares)
      WINNER_LINES.each do |line|

      return "Player" if squares[line[0]] == 'x' and squares[line[1]] == 'x' and squares[line[2]] == 'x'
      return "Computer" if squares[line[0]] == 'o' and squares[line[1]] == 'o' and squares[line[2]] == 'o'
    end
    nil
  end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)

  winner = check_winner(board)
end until winner || empty_position(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "its Tie :("
end
