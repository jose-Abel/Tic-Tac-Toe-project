# rubocop : disable Style/SafeNavigation

module HelperMethods
  def self.name_not_empty(*players)
    puts
    puts_message("Name can't be empty, can you please let me know a valid name?\n\n")
    players[1] ? players[1] = gets.chomp : players[0] = gets.chomp

    if players[0].empty?
      name_not_empty(players[0])
    elsif players[1] && players[1].empty?
      name_not_empty(players[0], players[1])
    elsif players[1] == players[0]
      repeated_name(players[0], players[1])
    else
      player = players[1] || players[0]
      puts_message("Great!, thanks #{player}\n\n")
      player
    end
  end

  def self.repeated_name(player_one, player_two)
    puts_message("Sorry #{player_two} is already taken, can you please let me know another name?\n\n")
    player_two = gets.chomp

    if player_two == player_one
      repeated_name(player_one, player_two)
    elsif player_two.length.zero?
      name_not_empty(player_one, player_two)
    else
      puts_message("Awesome, thanks #{player_two}, now lets play!\n\n")
      player_two
    end
  end
end

# rubocop : enable Style/SafeNavigation
