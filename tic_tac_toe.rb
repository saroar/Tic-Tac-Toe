# Tic Tac Toe

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
  squares.select { |_,v| v == ' ' }.keys
end

def empty?(squares, space)
  empties = empty_position(squares)
  empties.include?(space)
end


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


def check_winner(squares)
  WINNER_LINES.each do |line|
  return "Player"if squares.values_at(line[0], line[1], line[2]).count('x') == 3
  return "Computer" if squares.values_at(line[0], line[1], line[2]).count('o') == 3
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
