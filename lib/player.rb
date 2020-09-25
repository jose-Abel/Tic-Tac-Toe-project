# rubocop : disable Metrics/PerceivedComplexity

# rubocop : disable Metrics/CyclomaticComplexity

class Player
  attr_reader :name
  attr_reader :mark
  attr_accessor :has_won
  attr_accessor :moves

  def initialize(name, mark)
    @name = name
    @mark = mark
    @has_won = false
    @moves = []
  end

  def winning_moves
    horizontal = horizontal_checking
    vertical = vertical_checking
    diagonal = diagonal_checking
    return true if horizontal || vertical || diagonal
  end

  private

  def horizontal_checking
    if moves.include?('A1') && moves.include?('A2') && moves.include?('A3')
      puts
      puts "#{name} you won!"
      true
    elsif moves.include?('B1') && moves.include?('B2') && moves.include?('B3')
      puts
      puts "#{name} you won!"
      true
    elsif moves.include?('C1') && moves.include?('C2') && moves.include?('C3')
      puts
      puts "#{name} you won!"
      true
    else
      false
    end
  end

  def vertical_checking
    if moves.include?('A1') && moves.include?('B1') && moves.include?('C1')
      puts
      puts "#{name} you won!"
      true
    elsif moves.include?('A2') && moves.include?('B2') && moves.include?('C2')
      puts
      puts "#{name} you won!"
      true
    elsif moves.include?('A3') && moves.include?('B3') && moves.include?('C3')
      puts
      puts "#{name} you won!"
      true
    else
      false
    end
  end

  def diagonal_checking
    if moves.include?('A1') && moves.include?('B2') && moves.include?('C3')
      puts
      puts "#{name} you won!"
      true
    elsif moves.include?('A3') && moves.include?('B2') && moves.include?('C1')
      puts
      puts "#{name} you won!"
      true
    else
      false
    end
  end
end

# rubocop : enable Metrics/PerceivedComplexity

# rubocop : enable Metrics/CyclomaticComplexity
