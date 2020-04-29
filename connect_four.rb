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
            self.white.turn = false
        else
            self.black
            choice = get_choice(self.black)
            add_choice_to_board(choice, self.black)
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
            choice = gets
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
end




new_game = ConnectFour.new
new_game.gameloop