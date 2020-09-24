class Board

  @positions = { a1: '', a2: '', a3: '', b1: '', b2: '', b3: '', c1: '', c2: '', c3: '' }
  

  def move_in_board(player, board, player_move)
    if board.key?(player_move.downcase.to_sym) && board[player_move.downcase.to_sym].empty?
      board[player_move.downcase.to_sym] = player[:mark]
      player[:moves] << player_move
      puts
      puts "#{player[:name]} has choosen #{player[:moves]}\n\n"
      puts "Your move is now displayed in the board\n\n"
      paint_canvas(player, board)
  
    else
      message = "That's not a valid position in the board or has already been selected, please choose again!"
      puts
      get_user_input(player, board, message)
    end
    player[:has_won] = winning_moves(player)
  end
  
  def hash_has_blank(player, hsh)
    puts
    unless hsh.values.any?(&:empty?)
      puts "#{player[:name]}, there is no more spaces to pick from, both of you tie the game!"
    end
    hsh.values.any?(&:empty?)
  end

  def paint_canvas(_player, board)
    puts
    puts "     1 2 3\n\n"
    puts "A    #{board[:a1].empty? ? '_' : board[:a1]} #{board[:a2].empty? ? '_' : board[:a2]} #{board[:a3].empty? ? '_' : board[:a3]}"
    puts "B    #{board[:b1].empty? ? '_' : board[:b1]} #{board[:b2].empty? ? '_' : board[:b2]} #{board[:b3].empty? ? '_' : board[:b3]}"
    puts "C    #{board[:c1].empty? ? '_' : board[:c1]} #{board[:c2].empty? ? '_' : board[:c2]} #{board[:c3].empty? ? '_' : board[:c3]}"
  end

end