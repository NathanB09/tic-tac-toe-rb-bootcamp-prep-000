

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(n)
  n.to_i - 1
end

def move(array, u_index, char = "X")
  array[u_index] = char
  array
end

def position_taken?(array, index)
  array[index] == "X" || array[index] == "O"
end

def valid_move?(array, index)
  !position_taken?(array, index) && index.between?(0, 8)
end

def turn(board)
  puts "Please enter 1-9:"
  user_index = input_to_index(gets.strip)
  if valid_move?(board, user_index)
    move(board, user_index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  player_turn = 0
  while player_turn < 9
    player_turn += 1
    if player_turn % 2 == 0
      turn(board, "O")
    else
      turn(board, "X")
    end
  end
end

def turn_count(board)
  turn = 0
  board.each do |i|
  i == "X" || i == "O" ? turn += 1 : nil
  turn
end

def current_player(board)
  turn = turn_count(board)
  turn % 2 == 0 ? "X" : "O"
end

