require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
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
  @board = Board.new(@cells)
  end

  def test_board_exist

    assert_instance_of Board, @board
  end

  def test_board_has_cells

    assert_instance_of Hash, @board.cells
  end

end
