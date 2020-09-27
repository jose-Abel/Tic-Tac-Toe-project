module HelperMethods
  def self.name_not_empty
    puts
    puts_message("Name can't be empty, can you please let me know a valid name?\n\n")
    player = gets_chomp
    if player.empty?
      name_not_empty
    elsif !player.to_i.zero?
      name_not_number
    else
      player
    end
  end

  def self.repeated_name(_player_one, player_two)
    puts_message("Sorry #{player_two} is already taken, can you please let me know another name?\n\n")
    player_two = gets_chomp
    if player_two.empty?
      name_not_empty
    elsif !player.to_i.zero?
      name_not_number
    else
      player_two
    end
  end

  def self.name_not_number
    puts_message("Sorry the player name can't be a number, please choose a valid name\n\n")
    player = gets_chomp
    if !player.to_i.zero?
      name_not_number
    elsif player.empty?
      name_not_empty
    else
      player
    end
  end
end
