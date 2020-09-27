![](https://img.shields.io/badge/Microverse-blueviolet)


# Tic Tac Toe game in the console

The Microverse third project for the Ruby module that consists of creating a Tic Tac Toe game in the console by following 4 different stages or milestones for the overall implementation, each milestone has to have it's own git branch, and this branch consist in the 3rd milestone where the game logic is created and the codebase is completely change to an OOP programming paradigm.

For the OOP implementation 2 classes and 1 module were created grouping together all the methods that belong to each class and the module. The files are:

- The Player class that initializes with 4 attributes, the strings name and mark, the array moves and the boolean has_won, the strings name and mark are parameters for the initialize method. This class also has 1 public method called winning_moves and 11 private methods. The public method launch 3 private getter methods in charge of launching the other methods that verified just 1 set of winning moves in order to maintain DRY principles in the overall structure of the program.

- The Board class that initializes a variable named positions that contains the hash for the key-value pairs of the board. It also has the public methods move_in_board in charge of adding the "X" or "O" mark value, depending on the player, to its respective key in the board. If the position has already been chosen or does not exist in the board this method does some validation on that and called the get_user_input methods located in main again so that the user can try with a different choice. The Board class also has the methods hash_has_blank to determine if the board has any key without any value and as soon as there isn't any key with an empty value the game stops. Finally, it has the paint_canvas method in charge of displaying the board with the user's marks, either 'X' or 'O', in its respective key.

- The HelperMethods module with 3 methods, name_not_empty as the name implies it makes sure that the name field at the beginning is not left empty by either of the players, the repeated_name method in charge of making sure the second player doesn't choose the same name as the first and the name_not_number method to make sure neither of the player choose a number as a name.

<<<<<<< HEAD
- The main file has the main method where the board and the players are initialized, the players passing the name as elements in the array, that calls the choice_your_player method located in the same file, and the mark as 'X' or 'O'. The main file is also responsible for the core while loop that will keep running until either one of the players has_won property is set to true or the board hash_has_blank method returns false. The main file has the methods intro where the initial instructions are provided to the players, passing the board as argument to launch the paint_canvas method with the instructions in order to display the board at the beggining, it has the choose_your_player method that with 2 while loops and 1 until loops that repeats the same code for the 2 players in order to get their names and do validation that the name field is not left empty, that the second player doesn't choose the same name as the first and that neither of the players choose a number as a name. It also has the choosing_player method that extract some logic from the choose_your_player method in accordance with DRY principles. The main file also has the get_user_input method were, passing the player and the board arguments, is in charge of calling the move_in_board method for the board class on the board instance object. The main file has 3 methods, puts_message, print_message and gets_chomp, each of which launch either a puts, a prints or a gets.chomp command respectively, this is so that all the put, prints and gets.chomp commands are located in the main file. Lastly, it has the restarting_game method that ask if wants to restart the game with the options 'yes' or 'y' that will repeat the main function restarting the whole while loop and the game logic, 'no' or 'n' that will end the programm and else that repeats the same restarting function since either yes or no answer has to be provided.
=======
- The main file is where everything happens, it has the main method where the board and the players are initialized, the players passing the name as elements in the array, that calls the choice_your_player method located in the same file, and the mark as 'X' or 'O'. The main file is also responsible for the core while loop that will keep running until either one of the players has_won property is set to true or the board hash_has_blank method returns false. The main file has the methods intro where the initial instructions are provided to the players, passing the board as argument to launch the paint_canvas method with the instructions in order to display the board at the beggining, it has the choose_your_player method that with 2 while loops and 1 until loops that repeats the same code for the 2 players in order to get their names and do validation that the name field is not left empty, that the second player doesn't choose the same name as the first and that neither of the players choose a number as a name. It also has the choosing_player method that extract some logic from the choose_your_player method in accordance with DRY principles. The main file also has the get_user_input method were, passing the player and the board arguments, is in charge of calling the move_in_board method for the board class on the board instance object. Lastly, it has 3 methods, puts_message, print_message and gets_chomp, each of which launch either a puts, a prints or a gets.chomp command respectively, this is so that all the put, prints and gets.chomp commands are located in the main file.
>>>>>>> 972f086ee4d7f69d17675bada4924c7cb310de3d

## Built With
- Ruby programming language

## Author

- 👤GitHub: [Jose Abel Ramirez](https://github.com/jose-Abel)
- Linkedin: [Jose Abel Ramirez Frontany](https://www.linkedin.com/in/jose-abel-ramirez-frontany-7674a842/)

## Getting Started
<<<<<<< HEAD
You can clone this code anytime and run it with the Ruby interpreter in the Windows console or Unix terminal by typing 'ruby bin/main.rb' or it can run in Unix OS by typing 'bin/main.rb' in the terminal, without the 'ruby' interpreter command, since the main file has the shebang instruction at the top that makes it an executable file.
=======
You can clone this code anytime and run it with the Ruby interpreter in the Windows console or Unix terminal or it can run in Unix OS by typing bin/main.rb in the terminal since the main file has the shebang at the top to make it an executable file.

>>>>>>> 972f086ee4d7f69d17675bada4924c7cb310de3d

### Setup
You can either copy the code with git clone or with any other method and run it on your local environment.


### Run tests
Run the tests for the linters.yml and rubocop and everything pass!


### Acknowledgments
Appreciate the Ruby Team, and a special acknowledgment to Microverse for pushing us further into accomplishing our goals.


## 📝 License
This project is MIT licensed.


## Show your support
Give a ⭐️ if you like this project!
