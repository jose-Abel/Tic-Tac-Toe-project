#!/usr/bin/env ruby

# rubocop : disable Metrics/PerceivedComplexity

# rubocop : disable Metrics/CyclomaticComplexity

# rubocop : disable Lint/UselessAssignment

# rubocop : disable Layout/LineLength

def main
  intro

  players_arr = choose_your_player

  is_playing = true

  player_one = { name: players_arr[0], has_won: false, moves: [], mark: 'X' }

  player_two = { name: players_arr[1], has_won: false, moves: [], mark: 'O' }

  board = { a1: '', a2: '', a3: '', b1: '', b2: '', b3: '', c1: '', c2: '', c3: '' }

  while is_playing
    player_one[:has_won] = get_user_input(player_one, board)

    break if player_one[:has_won]
    break unless hash_has_blank(player_one, board)

    player_two[:has_won] = get_user_input(player_two, board)

    break if player_two[:has_won]
    break unless hash_has_blank(player_two, board)
  end
end

def intro
  puts "---------------------------------------------------------------------------------------------------\n"
  puts "Welcome to the Great Tic Tac Toe Game in the Console\n"
  puts
  puts "The board has 3 rows with the letters A, B and C and 3 columns with the numbers 1, 2 and 3\n"
  puts
  puts "You have to choose a position base on a row letter and a number column, for example A3.\n"
  puts
  puts "If you managed to choose positions sequentially either horizontal, vertical or diagonal you win!\n"
  puts
  puts "Time to play the game and that the best player wins, GLHF!\n"
  puts "----------------------------------------------------------------------------------------------------\n"
end

def choose_your_player
  players_arr = []
  puts
  puts "First player, can you please let me know your name?\n\n"

  player_one = gets.chomp

  player_one = name_not_empty(player_one) if player_one.length.zero?

  players_arr << player_one

  puts
  puts "Second player, now is your turn, please let me know your name?\n\n"

  player_two = gets.chomp

  player_two = name_not_empty(player_one, player_two) if player_two.length.zero?

  player_two = repeated_name(player_one, player_two) if player_two == player_one

  players_arr << player_two

  players_arr
end

def name_not_empty(player_one, player_two = false)
  puts
  puts "Name can't be empty, can you please let me know a valid name?\n\n"
  player_two == false ? player_one = gets.chomp : player_two = gets.chomp

  if player_one.empty?
    name_not_empty(player_one, player_two = false)
  elsif player_two&.empty?
    name_not_empty(player_one, player_two)
  elsif player_two == player_one
    repeated_name(player_one, player_two)
  else
    player = player_two == false ? player_one : player_two
    puts
    puts "Great!, thanks #{player}\n\n"
    player
  end
end

def repeated_name(player_one, player_two)
  puts
  puts "Sorry #{player_two} is already taken, can you please let me know another name?\n\n"
  player_two = gets.chomp

  if player_two == player_one
    repeated_name(player_one, player_two)
  elsif player_two.length.zero?
    name_not_empty(player_one, player_two)
  else
    puts
    puts "Awesome, thanks #{player_two}, now lets play!\n\n"
    player_two
  end
end

def paint_canvas(_player, board)
  puts "     1   2   3\n\n"
  puts "A    #{board[:a1].empty? ? '__' : board[:a1]}   #{board[:a2].empty? ? '__' : board[:a2]}   #{board[:a3].empty? ? '__' : board[:a3]}"
  puts "B    #{board[:b1].empty? ? '__' : board[:b1]}   #{board[:b2].empty? ? '__' : board[:b2]}   #{board[:b3].empty? ? '__' : board[:b3]}"
  puts "C    #{board[:c1].empty? ? '__' : board[:c1]}  #{board[:c2].empty? ? '__' : board[:c2]}   #{board[:c3].empty? ? '__' : board[:c3]}"
end

def get_user_input(player, board, message = false)
  if message == false
    puts
    puts "#{player[:name]} please choose a valid place in board, rows between A, B, C, columns between 1, 2, 3\n\n"
    puts "You are the #{player[:mark]}\n\n"
  else
    puts message
  end
  player_move = gets.chomp.upcase
  move_in_board(player, board, player_move)
end

def move_in_board(player, board, player_move)
  if board.key?(player_move.downcase.to_sym) && board[player_move.downcase.to_sym].empty?
    board[player_move.downcase.to_sym] = player[:mark]
    player[:moves] << player_move
    puts "#{player[:name]} has choosen #{player[:moves]}\n\n"
    puts "Your move is now displayed in the board\n\n"
    paint_canvas(player, board)

  else
    message = "That's not a valid position in the board or has already been selected, please choose again!"
    get_user_input(player, board, message)
  end
  player[:has_won] = winning_moves(player)
end

def winning_moves(player)
  horizontal = horizontal_checking(player)
  vertical = vertical_checking(player)
  diagonal = diagonal_checking(player)
  return true if horizontal || vertical || diagonal
end

def horizontal_checking(player)
  if player[:moves].include?('A1') && player[:moves].include?('A2') && player[:moves].include?('A3')
    puts
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('B1') && player[:moves].include?('B2') && player[:moves].include?('B3')
    puts
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('C1') && player[:moves].include?('C2') && player[:moves].include?('C3')
    puts
    puts "#{player[:name]} you won!"
    true
  else
    false
  end
end

def vertical_checking(player)
  if player[:moves].include?('A1') && player[:moves].include?('B1') && player[:moves].include?('C1')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A2') && player[:moves].include?('B2') && player[:moves].include?('C2')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A3') && player[:moves].include?('B3') && player[:moves].include?('C3')
    puts "#{player[:name]} you won!"
    true
  else
    false
  end
end

def diagonal_checking(player)
  if player[:moves].include?('A1') && player[:moves].include?('B2') && player[:moves].include?('C3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A3') && player[:moves].include?('B2') && player[:moves].include?('C1')
    puts "#{player[:name]} you won!"
    true
  else
    false
  end
end

def hash_has_blank(player, hsh)
  puts
  unless hsh.values.any?(&:empty?)
    puts "#{player[:name]}, there is no more spaces to pick from, both of you tie the game!"
  end
  hsh.values.any?(&:empty?)
end

main

# rubocop : enable Layout/LineLength

# rubocop : enable Lint/UselessAssignment

# rubocop : enable Metrics/PerceivedComplexity

# rubocop : enable Metrics/CyclomaticComplexity
