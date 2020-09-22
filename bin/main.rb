#!/usr/bin/env ruby

# rubocop : disable Metrics/ModuleLength

# rubocop : disable Metrics/PerceivedComplexity

# rubocop : disable Metrics/CyclomaticComplexity

def main
  intro

  players_arr = choose_your_player

  is_playing = true

  player_one = { name: players_arr[0], has_won: false, moves: [] }

  player_two = { name: players_arr[1], has_won: false, moves: [] }

  spaces = %w[A1 A2 A3 B1 B2 B3 C1 C2 C3]

  while is_playing
    player_one[:has_won] = get_user_input(player_one, spaces)

    break if player_one[:has_won]
    break if spaces_empty(player_one, spaces)

    player_two[:has_won] = get_user_input(player_two, spaces)

    break if player_two[:has_won]
    break if spaces_empty(player_two, spaces)
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

  players_arr << player_one

  puts
  puts "Second player, now is your turn, please let me know your name?\n\n"

  player_two = gets.chomp

  players_arr << player_two

  players_arr
end

def get_user_input(player, spaces, message = false)
  if message == false
    puts "#{player[:name]} please choose a valid place in board, rows between A, B, C, columns between 1, 2, 3\n\n"
  else
    puts message
  end
  player_move = gets.chomp.upcase
  move_in_board(player, spaces, player_move)
end

def move_in_board(player, spaces, player_move)
  if spaces.include?(player_move)
    spaces.delete(player_move)
    puts "spaces left are #{spaces}\n\n"
    player[:moves] << player_move
    puts "#{player[:name]} has choosen #{player[:moves]}\n\n"

  else
    message = "That's not a valid position in the board, please choose again!"
    get_user_input(player, spaces, message)
  end
  player[:has_won] = players_moves(player)
end

def players_moves(player)
  horizontal = horizontal_checking(player)
  vertical = vertical_checking(player)
  diagonal = diagonal_checking(player)
  return true if horizontal || vertical || diagonal
end

def horizontal_checking(player)
  if player[:moves].include?('A1') && player[:moves].include?('A2') && player[:moves].include?('A3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('B1') && player[:moves].include?('B2') && player[:moves].include?('B3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('C1') && player[:moves].include?('C2') && player[:moves].include?('C3')
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

def spaces_empty(player, spaces)
  puts "#{player[:name]}, there is no more spaces to pick from, both of you tie the game!" if spaces.length.zero?
  return true if spaces.length.zero?
end

main

# rubocop : enable Metrics/ModuleLength

# rubocop : enable Metrics/PerceivedComplexity

# rubocop : enable Metrics/CyclomaticComplexity
