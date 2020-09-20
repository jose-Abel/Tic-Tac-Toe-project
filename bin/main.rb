#!/usr/bin/env ruby

def main
  intro()

  players_arr = choose_your_player()

  isPlaying = true

  player_one = { name: players_arr[0], has_won: false, moves: []}

  player_two = { name: players_arr[1], has_won: false, moves: []}

  spaces = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']

  while isPlaying

    player_one[:has_won] = move_in_board(player_one, spaces)

    break if player_one[:has_won]
    break if spaces_empty(player_one, spaces)

    player_two[:has_won] = move_in_board(player_two, spaces)

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
  puts "Time to play the game and that the best player wins, GLHF! \n"
  puts "----------------------------------------------------------------------------------------------------\n"
end


def choose_your_player

  players_arr = []
  
  puts
  puts "First player, can you please let me know your name?\n"

  player_one = gets.chomp

  players_arr << player_one
  
  puts
  puts "Second player, now is your turn, please let me know your name?\n"
    
  player_two = gets.chomp

  players_arr << player_two

  players_arr
end

def move_in_board(player, spaces)
  
  puts
  puts "Awesome, so #{player[:name]} now is your turn, please choose a valid place in the board, rows are between the letters A, B and C and columns are between the numbers 1, 2 and 3\n"
  puts

  player_move = gets.chomp

  if spaces.include?(player_move)

    spaces.delete(player_move)

    puts "spaces left are #{spaces}" #Debugging

    player[:moves] << player_move

    puts "#{player[:name]} has choosen #{player[:moves]}" #Debugging

  elsif !spaces.include?(player_move)
    move_in_board(player, spaces)
  end

  player[:has_won] = checking_players_moves(player)
end

def checking_players_moves(player)
  if player[:moves].include?('A1') && player[:moves].include?('A2') && player[:moves].include?('A3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('B1') && player[:moves].include?('B2') && player[:moves].include?('B3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('C1') && player[:moves].include?('C2') && player[:moves].include?('C3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A1') && player[:moves].include?('B1') && player[:moves].include?('C1')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A2') && player[:moves].include?('B2') && player[:moves].include?('C2')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A3') && player[:moves].include?('B3') && player[:moves].include?('C3')
    puts "#{player[:name]} you won!"
    true
  elsif player[:moves].include?('A1') && player[:moves].include?('B2') && player[:moves].include?('C3')
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
  if spaces.length == 0
    puts "#{player[:name]}, there is no more spaces to pick from, both of you tie the game!"
    true
  end
end


main
