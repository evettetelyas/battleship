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
  @cruiser = Ship.new("Cruiser", 3)
  @submarine = Ship.new("Submarine", 2)
  end

  def test_board_exist

    assert_instance_of Board, @board
  end

  def test_board_has_cells

    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
  end

  def test_if_coordinate_is_valid

    assert @board.valid_coordinate(:A1)

    assert @board.valid_coordinate(:D4)

    refute @board.valid_coordinate(:A5)

    refute @board.valid_coordinate(:E1)

    refute @board.valid_coordinate(:A22)
  end

  def test_valid_placement_for_ship

    refute @board.valid_placement?(@cruiser, [:A1, :A2])

    refute @board.valid_placement?(@submarine, [:A2, :A3, :A4])
  end

  def test_all_letters_of_coordinates_same
    coordinates_1 = [:A1, :A2, :A3]

    assert @board.all_letters_same?(coordinates_1)

    coordinates_2 = [:A1, :A2, :A4]

    assert @board.all_letters_same?(coordinates_2)

    coordinates_3 = [:A1, :B2, :A4]

    refute @board.all_letters_same?(coordinates_3)
  end

end
