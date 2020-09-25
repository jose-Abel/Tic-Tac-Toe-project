# rubocop : disable Layout/LineLength

# rubocop : disable Metrics/PerceivedComplexity

# rubocop : disable Metrics/CyclomaticComplexity

# rubocop : disable Metrics/AbcSize

class Board
  attr_accessor :positions

  def initialize
    @positions = { a1: '', a2: '', a3: '', b1: '', b2: '', b3: '', c1: '', c2: '', c3: '' }
  end

  def move_in_board(player, player_move)
    if positions.key?(player_move.downcase.to_sym) && positions[player_move.downcase.to_sym].empty?
      positions[player_move.downcase.to_sym] = player.mark
      player.moves << player_move
      puts
      puts "#{player.name} has choosen #{player.moves}\n\n"
      puts "Your move is now displayed in the board\n\n"
      paint_canvas

    else
      message = "That's not a valid position in the board or has already been selected, please choose again!"
      puts
      get_user_input(player, self, message)
    end
    player.has_won = player.winning_moves
  end

  def hash_has_blank(player)
    puts
    unless positions.values.any?(&:empty?)
      puts "#{player.name}, there is no more spaces to pick from, both of you tie the game!"
    end
    positions.values.any?(&:empty?)
  end

  def paint_canvas
    puts
    puts "     1 2 3\n\n"
    puts "A    #{positions[:a1].empty? ? '_' : positions[:a1]} #{positions[:a2].empty? ? '_' : positions[:a2]} #{positions[:a3].empty? ? '_' : positions[:a3]}"
    puts "B    #{positions[:b1].empty? ? '_' : positions[:b1]} #{positions[:b2].empty? ? '_' : positions[:b2]} #{positions[:b3].empty? ? '_' : positions[:b3]}"
    puts "C    #{positions[:c1].empty? ? '_' : positions[:c1]} #{positions[:c2].empty? ? '_' : positions[:c2]} #{positions[:c3].empty? ? '_' : positions[:c3]}"
  end
end

# rubocop : enable Metrics/AbcSize

# rubocop : enable Layout/LineLength

# rubocop : enable Metrics/PerceivedComplexity

# rubocop : enable Metrics/CyclomaticComplexity
