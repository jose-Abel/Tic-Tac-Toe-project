# rubocop : disable Lint/UselessAssignment

module HelperMethods
  def self.name_not_empty(player_one, player_two = false)
    puts
    puts "Name can't be empty, can you please let me know a valid name?\n\n"
    player_two == false ? player_one = gets.chomp : player_two = gets.chomp

    if player_one.empty?
      name_not_empty(player_one, player_two = false)
    elsif player_two&.empty?
      name_not_empty(player_one, player_two)
    elsif player_two == player_one
      repeated_name(player_one, player_two)
    else
      player = player_two == false ? player_one : player_two
      puts
      puts "Great!, thanks #{player}\n\n"
      player
    end
  end

  def self.repeated_name(player_one, player_two)
    puts
    puts "Sorry #{player_two} is already taken, can you please let me know another name?\n\n"
    player_two = gets.chomp

    if player_two == player_one
      repeated_name(player_one, player_two)
    elsif player_two.length.zero?
      name_not_empty(player_one, player_two)
    else
      puts
      puts "Awesome, thanks #{player_two}, now lets play!\n\n"
      player_two
    end
  end
end

# rubocop : enable Lint/UselessAssignment
