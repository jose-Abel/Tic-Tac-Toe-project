module HelperMethods
  def self.name_not_empty(player_one, player_two = false)
    puts
    send_message("Name can't be empty, can you please let me know a valid name?\n\n")
    player_two == false ? player_one = gets.chomp : player_two = gets.chomp

    if player_one.empty?
      name_not_empty(player_one)
    elsif player_two
      name_not_empty(player_one, player_two) if player_two.length.zero?
    elsif player_two == player_one
      repeated_name(player_one, player_two)
    else
      player = player_two == false ? player_one : player_two
      send_message("Great!, thanks #{player}\n\n")
      player
    end
  end

  def self.repeated_name(player_one, player_two)
    send_message("Sorry #{player_two} is already taken, can you please let me know another name?\n\n")
    player_two = gets.chomp

    if player_two == player_one
      repeated_name(player_one, player_two)
    elsif player_two.length.zero?
      name_not_empty(player_one, player_two)
    else
      send_message("Awesome, thanks #{player_two}, now lets play!\n\n")
      player_two
    end
  end
end
