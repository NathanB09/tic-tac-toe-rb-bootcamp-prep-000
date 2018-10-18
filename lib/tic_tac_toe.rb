

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