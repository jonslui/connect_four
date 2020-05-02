**Connect Four in the Terminal using Ruby and Object Oriented Programming**
========

The goal when creating this project was to further practice Object Oriented Programming and practice writing tests.

You can run this program by running connect_four.rb in the teminal, and then following the prompts. It is designed to play with another person.

To play: 
    Make sure you have Ruby installed with "ruby --version"
    Install the current_four.rb file
    Open the terminal
    Navigate to the root folder where current_four.rb has been saved
    Enter "ruby current_four.rb"
    Enjoy!

How the program works
---------------------

Each entry is recorded to an array called "board" in the ConnectFour Class. The board array contains an array for each value from [0] - [6]. Each of these arrays is a column.

<!-- ![Screenshot from Terminal](/images/choose_a_column.png) -->

When the player selects a column, the player's symbol is appended to the corresponding array within board. After being appended to board, it's index is appended to the player's individual Class variable "choices" which is set up the same as board. 

<!-- ![Screenshot from Terminal](/images/place_peice.png) -->

After each turn a function "check_for_win(player)" is run. This function takes the instance of the current Player Class and checks class variable "choices" for a winning combination.

<!-- ![Winning Combination](/images/winningscreenshot.png) -->