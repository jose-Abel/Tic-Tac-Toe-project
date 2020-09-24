class Player


  def initialize({name, mark})
    @name = name
    @has_won = false
    @moves = []
    @mark = mark
  end

  def winning_moves(self)
    horizontal = horizontal_checking(self)
    vertical = vertical_checking(self)
    diagonal = diagonal_checking(self)
    return true if horizontal || vertical || diagonal
  end
  
  def horizontal_checking(self)
    if self[:moves].include?('A1') && self[:moves].include?('A2') && player[:moves].include?('A3')
      puts
      puts "#{self[:name]} you won!"
      true
    elsif self[:moves].include?('B1') && self[:moves].include?('B2') && self[:moves].include?('B3')
      puts
      puts "#{self[:name]} you won!"
      true
    elsif self[:moves].include?('C1') && self[:moves].include?('C2') && self[:moves].include?('C3')
      puts
      puts "#{self[:name]} you won!"
      true
    else
      false
    end
  end
  
  def vertical_checking(self)
    if self[:moves].include?('A1') && self[:moves].include?('B1') && self[:moves].include?('C1')
      puts
      puts "#{self[:name]} you won!"
      true
    elsif self[:moves].include?('A2') && self[:moves].include?('B2') && self[:moves].include?('C2')
      puts
      puts "#{self[:name]} you won!"
      true
    elsif self[:moves].include?('A3') && self[:moves].include?('B3') && self[:moves].include?('C3')
      puts
      puts "#{self[:name]} you won!"
      true
    else
      false
    end
  end
  
  def diagonal_checking(self)
    if self[:moves].include?('A1') && self[:moves].include?('B2') && self[:moves].include?('C3')
      puts
      puts "#{self[:name]} you won!"
      true
    elsif self[:moves].include?('A3') && self[:moves].include?('B2') && self[:moves].include?('C1')
      puts
      puts "#{self[:name]} you won!"
      true
    else
      false
    end
  end
end

