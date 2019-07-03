require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/dynamic_board'
require './lib/board'
require 'pry'

class DynamicBoardTest < Minitest::Test

  def test_new_board
    dynamic_board = DynamicBoard.new

    assert_instance_of DynamicBoard, dynamic_board
  end

  def test_set_size
    dynamic_board = DynamicBoard.new
    dynamic_board.set_size

    # enter 4 for all prompts

    assert_equal 4, dynamic_board.height
    assert_equal 4, dynamic_board.width
  end

  def test_grid_coordinate_arrays_y_axis
    dynamic_board = DynamicBoard.new
    dynamic_board.set_size
    dynamic_board.set_y_axis_grid_coordinate_array

    assert_equal [1, 2, 3, 4], dynamic_board.y_axis
  end

  def test_grid_coordinate_arrays_x_axis
    dynamic_board = DynamicBoard.new
    dynamic_board.set_size
    dynamic_board.set_x_axis_grid_coordinate_array

    assert_equal ["A", "B", "C", "D"], dynamic_board.x_axis
  end

  def test_create_cells
    dynamic_board = DynamicBoard.new
    dynamic_board.set_size
    dynamic_board.set_y_axis_grid_coordinate_array
    dynamic_board.set_x_axis_grid_coordinate_array
    dynamic_board.create_cells

    assert_instance_of Cell, dynamic_board.cell[:D4]
    assert_instance_of Cell, dynamic_board.cell[:B2]
    assert_instance_of Cell, dynamic_board.cell[:A3]
    refute_instance_of Cell, dynamic_board.cell[:A6]
    refute_instance_of Cell, dynamic_board.cell[:E2]
  end

end
