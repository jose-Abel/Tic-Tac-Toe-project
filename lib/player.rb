class Player
  attr_reader :name, :mark, :has_won, :moves
  attr_writer :has_won, :moves

  def initialize(name, mark)
    @name = name
    @mark = mark
    @has_won = false
    @moves = []
  end

  def winning_moves
    horizontal = horizontal_getter

    vertical = vertical_getter

    diagonal = diagonal_getter

    true if horizontal || vertical || diagonal
  end

  private

  def horizontal_getter
    true if horizontal_checking_a || horizontal_checking_b || horizontal_checking_c
  end

  def vertical_getter
    true if vertical_checking_one || vertical_checking_two || vertical_checking_three
  end

  def diagonal_getter
    true if diagonal_top_bottom || diagonal_bottom_top
  end

  def horizontal_checking_a
    if moves.include?('A1') && moves.include?('A2') && moves.include?('A3')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def horizontal_checking_b
    if moves.include?('B1') && moves.include?('B2') && moves.include?('B3')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def horizontal_checking_c
    if moves.include?('C1') && moves.include?('C2') && moves.include?('C3')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def vertical_checking_one
    if moves.include?('A1') && moves.include?('B1') && moves.include?('C1')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def vertical_checking_two
    if moves.include?('A2') && moves.include?('B2') && moves.include?('C2')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def vertical_checking_three
    if moves.include?('A3') && moves.include?('B3') && moves.include?('C3')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def diagonal_top_bottom
    if moves.include?('A1') && moves.include?('B2') && moves.include?('C3')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end

  def diagonal_bottom_top
    if moves.include?('A3') && moves.include?('B2') && moves.include?('C1')
      puts_message("#{name} you won!")
      true
    else
      false
    end
  end
end
