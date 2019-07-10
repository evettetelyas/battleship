loop do

require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

puts "\n\n\n\u{1F6A2 1F4A3 1F4A6}WELCOME TO BATTLESHIP\u{1F4A6 1F4A3 1F6A2}"
  puts "Enter p to play. Enter q to quit"
  print "> "
    answer = gets.chomp.downcase
    until answer == "p" || answer == "q"
      puts "that's not valid, please try again!"
      puts "Enter p to play. Enter q to quit"
      print "> "
      answer = gets.chomp.downcase
    end
    if answer == "q"
      puts "Goodbye!"
      exit
    end

    puts "Add the dimensions of your board:"
    print "Height: "
    @height = gets.chomp.to_i
    print "Width: "
    @width = gets.chomp.to_i
    if @height < 4 || @width < 4
      puts "\nBoth height and width must be at least 4 cells. Automatically set to 4x4 board."
      @height = 4
      @width = 4
    elsif @height > 9 || @width > 9
        puts "\nYour board is too big. Both height and width must be 9 cells or less. Automatically set to 9x9 board."
          @height = 9
          @width = 9
        elsif @height.between?(4,9) && @width.between?(4,9)
          puts "\nGreat! You are all set with a #{@height}x#{@width} board!"
        else puts "\nThat's not a valid input, please try again:"
          print "Height: "
          @height = gets.chomp.to_i
          print "Width: "
          @width = gets.chomp.to_i
        end

        puts "\n\nNow, let's set up the ships!"
        puts "Name your first ship:"
        print "> "
        ship_1_name = gets.chomp.capitalize
        puts "How many cells will the #{ship_1_name} take?"
        print "> "
        ship_1_health = gets.chomp.to_i

        puts "Name your second ship:"
        print "> "
        ship_2_name = gets.chomp.capitalize
        puts "How many cells will the #{ship_2_name} take?"
        print "> "
        ship_2_health = gets.chomp.to_i

        puts "Name your third ship:"
        print "> "
        ship_3_name = gets.chomp.capitalize
        puts "How many cells will the #{ship_3_name} take?"
        print "> "
        ship_3_health = gets.chomp.to_i

@computer_board = Board.new(@height, @width)
@player_board = Board.new(@height, @width)
@game = Game.new(@computer_board, @player_board)

@game.player_ships[:ship_1] = Ship.new(ship_1_name, ship_1_health)
@game.player_ships[:ship_2] = Ship.new(ship_2_name, ship_2_health)
@game.player_ships[:ship_3] = Ship.new(ship_3_name, ship_3_health)
@game.comp_ships[:ship_1] = Ship.new(ship_1_name, ship_1_health)
@game.comp_ships[:ship_2] = Ship.new(ship_2_name, ship_2_health)
@game.comp_ships[:ship_3] = Ship.new(ship_3_name, ship_3_health)

@computer_board.make_cell_hash
@player_board.make_cell_hash
@game.place_all_comp_ships

end
