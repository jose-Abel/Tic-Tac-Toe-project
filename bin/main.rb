#!/usr/bin/env ruby

puts '------------------------------------------------------------------------------------'
puts 'Welcome to the Great Tic Tac Toe Game in the Console, be prepared to have some fun!'
puts '------------------------------------------------------------------------------------'

puts

puts 'Player 1, can you please let me know your name?'

player_one = gets.chomp

puts

puts 'Player 2, now is your turn, please let me know your name?'

puts

player_two = gets.chomp

puts

puts "Alrighty, so #{player_one} yo'll go first, please choose spot in the board"

player_one_move = gets.chomp

puts

puts "Great, #{player_one} played #{player_one_move}, your move is displayed on the board"

puts

puts "#{player_two}, is your turn now, please choose spot in the board"

player_two_move = gets.chomp

puts

puts "Awesome, #{player_two} played #{player_two_move}, your move is displayed on the board"

puts
