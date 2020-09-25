#!/usr/bin/env ruby

require_relative '../lib/player'

require_relative '../lib/board'

require_relative '../lib/helper'

def main
  intro

  players_arr = choose_your_player

  is_playing = true

  player_one = Player.new(players_arr[0], 'X')

  player_two = Player.new(players_arr[1], 'O')

  board = Board.new

  while is_playing
    player_one.has_won = get_user_input(player_one, board)

    break if player_one.has_won
    break unless board.hash_has_blank(player_one)

    player_two.has_won = get_user_input(player_two, board)

    break if player_two.has_won
    break unless board.hash_has_blank(player_two)
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

  player_one = HelperMethods.name_not_empty(player_one) if player_one.length.zero?

  players_arr << player_one

  puts
  puts "Second player, now is your turn, please let me know your name?\n\n"

  player_two = gets.chomp

  player_two = HelperMethods.name_not_empty(player_one, player_two) if player_two.length.zero?

  player_two = HelperMethods.repeated_name(player_one, player_two) if player_two == player_one

  players_arr << player_two

  players_arr
end

def get_user_input(player, board, message = false)
  if message == false
    puts
    puts "#{player.name} please choose a valid place in board, rows between A, B, C, columns between 1, 2, 3\n\n"
    puts "You are the #{player.mark}\n"
    board.paint_canvas if board.positions.values.all?(&:empty?)
    puts
  else
    puts message
  end
  player_move = gets.chomp.upcase
  board.move_in_board(player, player_move)
end

main
