require "pry"

class TicTacToe

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    attr_accessor
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    @@all = []
    # @@counter = 0
    

    def display_board

        
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        x = input.to_i
        x -= 1
    end

    def move(index, player)
        # @@counter += 1
        @board[index] = player
        @@all << self
        # binding.pry
    end

    def position_taken?(index)
        if @board[index] == " "
            false
        else
            true
        end
    end

    def valid_move?(index)
        if @board[index] == " " && index.between?(0, 8)
            true
        else
            false
        end
    end

    def turn_count
        counter = 0
        @board.each do |spot|
            if spot == "X" || spot == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player

        if turn_count.odd?
            "O"
        else
            "X"
        end
    end

    def turn

        input = gets.to_i
    
        i = input_to_index(input)
        if valid_move?(i)
            move(i, current_player)
            display_board
        else
            turn
        end
        
    end

    def won?
        WIN_COMBINATIONS.any? do |combo|
            
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                return combo
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return combo
            end
        end
    end
    
    def full?
        if @board.any? {|place| place == " "}
            false
        else
            true
        end
    end

    def draw?
        if won?
            false
        elsif
            @board.any? {|place| place == " "}
                false
        else
            true
        end
    end

    def over?
        if draw?
            true
        elsif won?
            true
        else !full?
            false
        end
    end

    def winner
        winner = nil
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                winner = "X"
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                winner = "O"
            end
        end
        winner
    end

    def play
        until over? == true
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end
