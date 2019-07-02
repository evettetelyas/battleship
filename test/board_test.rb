require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_board_exist
    board = Board.new

    assert_instance_of Board, board
  end

  def test_board_has_cells
    board = Board.new

    assert_instance_of Hash, board.cells

  end

end
