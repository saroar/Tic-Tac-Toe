


# 1. Draw a board

# assign player "X"
# assign computer "O"


# loop until a winner or all squares are taken
# 2. player1 pick a empty square
# 3. computer pick a empty square
# 4. check for winner

# if there is winner show the winner else its tie


def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' ' }
  b
end

def draw_board(b)
  system 'clear'
  puts "  #{b[1]} | #{b[2]}  | #{b[3]}  "
  puts "----+----+-----"
  puts "  #{b[4]} | #{b[5]}  | #{b[6]}  "
  puts "----+----+-----"
  puts "  #{b[7]} | #{b[8]}  | #{b[9]}  "
end

def empty_position(b)
  b.select { |k,v| v == ' ' }.keys
end

def empty?(b, space)
  empties = empty_position(b)
  empties.include?(space)
end

def player_picks_square(b)
  puts "Pick a square (1 - 9)"
  position = gets.chomp.to_i
  until empty?(b, position)
  puts "Place is taken, choose a free space?"
  position = gets.chomp.to_i
  end
  b[position] = 'x'
end


def computer_picks_square(b)
  sleep 0.5
  position = empty_position(b).sample
  b[position] = 'o'
end

WINNER_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) ==
    hsh.select { |k,v| v == '  '}.keys.first
  else
    false
  end
end

def check_winner(b)
      WINNER_LINES.each do |line|

      return "Player" if b[line[0]] == 'x' and b[line[1]] == 'x' and b[line[2]] == 'x'
      return "Computer" if b[line[0]] == 'o' and b[line[1]] == 'o' and b[line[2]] == 'o'
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
