class Board
  attr_reader :positions
  attr_writer :positions

  def initialize
    @positions = { a1: '', a2: '', a3: '', b1: '', b2: '', b3: '', c1: '', c2: '', c3: '' }
  end

  def move_in_board(player, player_move)
    if positions.key?(player_move.downcase.to_sym) && positions[player_move.downcase.to_sym].empty?
      positions[player_move.downcase.to_sym] = player.mark
      player.moves << player_move
      puts_message("#{player.name} has choosen #{player.moves}\n\n")
      puts_message("Your move is now displayed in the board\n\n")
      paint_canvas
      player.has_won = player.winning_moves

    else
      message = "That's not a valid position in the board or has already been selected, please choose again!"
      get_user_input(player, self, message)
    end
  end

  def hash_has_blank(player)
    puts_message('')
    unless positions.values.any?(&:empty?)
      puts_message("#{player.name}, there is no more spaces to pick from, both of you tie the game!")
    end
    positions.values.any?(&:empty?)
  end

  def paint_canvas
    variables = %w[A B C]

    numbers = %w[1 2 3]

    i = 0
    y = 0

    puts_message("   1  2  3\n\n")

    while i < variables.length
      var = variables[i].downcase

      key = positions[(var + numbers[y].to_s).to_s.to_sym]

      print_message("#{variables[i]}  #{key.empty? ? '_' : key}  ")
      y += 1
      key = positions[(var + numbers[y].to_s).to_s.to_sym]

      print_message("#{key.empty? ? '_' : key}  ")
      y += 1
      key = positions[(var + numbers[y].to_s).to_s.to_sym]

      print_message((key.empty? ? '_' : key).to_s)
      y = 0
      key = positions[(var + numbers[y].to_s).to_s.to_sym]

      puts_message('')
      i += 1
    end
  end
end
