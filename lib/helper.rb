module HelperMethods
  def self.name_not_empty
    puts
    puts_message("Name can't be empty, can you please let me know a valid name?\n\n")
    player = gets.chomp
    if player.empty?
      name_not_empty
    else
      player
    end
  end

  def self.repeated_name(_player_one, player_two)
    puts_message("Sorry #{player_two} is already taken, can you please let me know another name?\n\n")
    player_two = gets.chomp
    player_two.length.zero? ? name_not_empty : player_two
  end
end
