class Player
    attr_accessor :color, :choices, :turn, :name

    def initialize(color, name)
        @color = color
        @choices = [[],[],[],[],[],[],[]]
        @turn = nil
        @name = name
    end
end


class ConnectFour
    attr_accessor :white, :black, :board

    # board has 7 columns and 6 rows 
    def initialize
        @board = [[],[],[],[],[],[],[]]
        @white = Player.new("\u25ef".encode('utf-8'), "White")
        @black = Player.new("\u25c9".encode('utf-8'), "Black") 
    end


    def gameloop
        if self.white.turn == nil || self.white.turn == true
            self.white
            choice = get_choice(self.white)
            add_choice_to_board(choice, self.white)

            if check_for_win(self.white) == true
                print_display
                return
            end

            self.white.turn = false
        else
            self.black
            choice = get_choice(self.black)
            add_choice_to_board(choice, self.black)
            if check_for_win(self.black) == true
                print_display
                return
            end
            self.white.turn = true
        end
        print_display
        gameloop
    end


    def print_display
        counter = 5
        6.times do
            self.board.each do |row| 
                if row[counter].is_a?(String) == false 
                    print " - "
                else
                    print " #{row[counter]} "
                end
            end
            puts
            counter -= 1
        end
        puts " 1  2  3  4  5  6  7 "
    end


    def get_choice(player)
        choice = ""
        until choice.match?(/[1-7]/) == true
            print "#{player.name}, choose a column: "
            choice = gets.chomp
            
            # make sure number chosen is not more than 1 didgit long
            if choice.length != 1
                puts "Column must be between 1 and 7: "
                choice = ""
            
            # if there are already 6 peices in that column, prompt again
            elsif self.board[choice.to_i - 1].length == 6
                puts "That column is full!"
                choice = ""
            end

        end
        return choice
    end

    # subtract 1 from column because array indexes begin at 0
    def add_choice_to_board(column, player)
        if self.board[column.to_i - 1].length < 6
            self.board[column.to_i - 1].push(player.color)
            player.choices[column.to_i - 1].push(self.board[column.to_i - 1].length - 1)
            print player.choices
            puts
        else
            # add case for if column height already exceeds 6

        end
    end


    def check_for_win(player)

        # check for vertical win
        player.choices.each do |column|
            tmp = column
            while tmp.length > 3 
                if tmp[1] == tmp[0] + 1 && tmp[2] == tmp[1] +1 && tmp[3] == tmp[2] + 1
                    puts "#{player.name} wins!"
                    return true
                end
                tmp = tmp.slice(1..-1)
            end
        end

        # check for horizontal win
        6.times do 
            counter = 0
            row = []
            
            # add all values in the first row of each column to row
            row << player.choices[0][counter] 
            row << player.choices[1][counter] 
            row << player.choices[2][counter] 
            row << player.choices[3][counter] 
            row << player.choices[4][counter] 
            row << player.choices[5][counter] 
            row << player.choices[6][counter] 

            while row.length > 3
                if row[0] == counter && row[1] == counter && row[2] == counter && row[3] == counter
                    puts "#{player.name} wins!"
                    return true
                end
            row = row.slice(1 ..  -1)
            end

            counter +=1
        end

        # check for diagonal win
        # 24 cases, 12 mirrored

        

        return false
    end
end




new_game = ConnectFour.new
new_game.gameloop