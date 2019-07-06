require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

  @cells = {
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
@computer_board = Board.new(@cells)
@cruiser = Ship.new("Cruiser", 3)
@submarine = Ship.new("Submarine", 2)


def start
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit"
  print "> "

  answer = gets.chomp.downcase

  if answer == "q"
    puts "Goodbye!"
  elsif answer == "p"
   @computer_board.render
  end
  @computer_board.place_comp_cruiser(@cruiser)
    @computer_board.place_comp_cruiser(@submarine)
end

start
