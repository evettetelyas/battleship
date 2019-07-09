require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

puts "Add the dimensions of your board:"
    print "Height: "
    @height = gets.chomp.to_i
    print "Width: "
    @width = gets.chomp.to_i
    if @height < 4 || @width < 4
      puts "Your board is too small. Both height and width must be at least 4 cells. Automatically set to 4x4 board."
        @height = 4
        @width = 4
      elsif @height > 9 || @width > 9
        puts "Your board is too big. Both height and width must be 9 cells or less. Automatically set to 9x9 board."
          @height = 9
          @width = 9
    end



@computer_board = Board.new(@height, @width)
@player_board = Board.new(@height, @width)
@computer_cruiser = Ship.new("Cruiser", 3)
@player_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)
@player_submarine = Ship.new("Submarine", 2)
@game = Game.new(@computer_board, @player_board)

@computer_board.make_cell_hash
@player_board.make_cell_hash
@game.start
