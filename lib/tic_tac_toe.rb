WIN_COMBINATIONS = [
  [0, 1, 2], #row 1
  [3, 4, 5], #row 2
  [6, 7, 8], #row 3
  [0, 3, 6], #column 1
  [1, 4, 7], #column 2
  [2, 5, 8], #column 2
  [0, 4, 8], #diagonal 1
  [6, 4, 2] #diagonal 2
]

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

def move(array, u_index, char)
  array[u_index] = char
  array
end

def position_taken?(array, index)
  array[index] == "X" || array[index] == "O"
end

def valid_move?(array, index)
  !position_taken?(array, index) && index.between?(0, 8)
end

def turn(board, char = "X")
  puts "Please enter 1-9:"
  user_index = input_to_index(gets.strip)
  if valid_move?(board, user_index)
    move(board, user_index, char)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turn = 0
  board.each do |i|
    i == "X" || i == "O" ? turn += 1 : nil
  end
  turn
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    pos_1 = board[combination[0]]
    pos_2 = board[combination[1]]
    pos_3 = board[combination[2]]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      combination
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      combination
    else
      false
    end
  end
end

def full?(board)
  !board.include?(" " || "" || nil)
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  won?(board).class == Array ? board[won?(board)[0]] : nil
end

def play(board)
  player_turn = turn_count(board)
  while turn_count(board) < 9 && !over?(board)
    puts turn_count(board)
    turn(board, current_player(board))
  end

  if won?(board)
    puts "Congratulations #{current_player(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
