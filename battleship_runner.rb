require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

  @computer_cells = {
            A1: Cell.new(:A1),
            A2: Cell.new(:A2),
            A3: Cell.new(:A3),
            A4: Cell.new(:A4),
            B1: Cell.new(:B1),
            B2: Cell.new(:B2),
            B3: Cell.new(:B3),
            B4: Cell.new(:B4),
            C1: Cell.new(:C1),
            C2: Cell.new(:C2),
            C3: Cell.new(:C3),
            C4: Cell.new(:C4),
            D1: Cell.new(:D1),
            D2: Cell.new(:D2),
            D3: Cell.new(:D3),
            D4: Cell.new(:D4)
          }
  @player_cells = {
            A1: Cell.new(:A1),
            A2: Cell.new(:A2),
            A3: Cell.new(:A3),
            A4: Cell.new(:A4),
            B1: Cell.new(:B1),
            B2: Cell.new(:B2),
            B3: Cell.new(:B3),
            B4: Cell.new(:B4),
            C1: Cell.new(:C1),
            C2: Cell.new(:C2),
            C3: Cell.new(:C3),
            C4: Cell.new(:C4),
            D1: Cell.new(:D1),
            D2: Cell.new(:D2),
            D3: Cell.new(:D3),
            D4: Cell.new(:D4)
                  }
@computer_board = Board.new(@computer_cells)
@player_board = Board.new(@player_cells)
@computer_cruiser = Ship.new("Cruiser", 3)
@player_cruiser = Ship.new("Cruiser", 3)
@computer_submarine = Ship.new("Submarine", 2)
@player_submarine = Ship.new("Submarine", 2)

def start
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit"
  print "> "

  answer = gets.chomp.downcase

  if answer == "q"
    puts "Goodbye!"
  elsif answer == "p"
  end
  @computer_board.place_comp_ship(@computer_cruiser)
  @computer_board.place_comp_ship(@computer_submarine)

  puts "I have laid out my ships on the grid. You now need to lay your two ships. The Cruiser is three units long, and the Submarine is two."
  puts @player_board.render
  puts "Enter the squares for your Cruiser"
  print "> "

  player_cruiser_placement_data = gets.chomp.upcase.split(" ")

  player_cruiser_placement = player_cruiser_placement_data.map {|cell| cell.to_sym}

end



start
