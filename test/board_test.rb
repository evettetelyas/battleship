require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @cells = {




              # A1: Cell.new,
              # A2: Cell.new,
              # A3: Cell.new,
              # A4: Cell.new,
              # B1: Cell.new,
              # B2: Cell.new,
              # B3: Cell.new,
              # B4: Cell.new,
              # C1: Cell.new,
              # C2: Cell.new,
              # C3: Cell.new,
              # C4: Cell.new,
              # D1: Cell.new,
              # D2: Cell.new,
              # D3: Cell.new,
              # D4: Cell.new
            }
  @board = Board.new(@cells)
  end

  def test_board_exist


    assert_instance_of Board, @board
  end

  def test_board_has_cells
    skip

    assert_instance_of Hash, @board.cells

  end

end
