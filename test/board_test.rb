require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    # @cells = {
    #           A1: Cell.new(:A1),
    #           A2: Cell.new(:A2),
    #           A3: Cell.new(:A3),
    #           A4: Cell.new(:A4),
    #           B1: Cell.new(:B1),
    #           B2: Cell.new(:B2),
    #           B3: Cell.new(:B3),
    #           B4: Cell.new(:B4),
    #           C1: Cell.new(:C1),
    #           C2: Cell.new(:C2),
    #           C3: Cell.new(:C3),
    #           C4: Cell.new(:C4),
    #           D1: Cell.new(:D1),
    #           D2: Cell.new(:D2),
    #           D3: Cell.new(:D3),
    #           D4: Cell.new(:D4)
    #         }
    #         @board = Board.new(@cells)
            @board = Board.new()
            @cruiser = Ship.new("Cruiser", 3)
            @submarine = Ship.new("Submarine", 2)
  end

  def test_board_exist

    assert_instance_of Board, @board
  end

  def test_make_cells
  end

  def test_board_has_cells
    @board.make_cell_hash
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.count
  end

  def test_if_coordinate_is_valid
    @board.make_cell_hash
    assert @board.valid_coordinate(:A1)
    assert @board.valid_coordinate(:D4)
    refute @board.valid_coordinate(:A5)
    refute @board.valid_coordinate(:E1)
    refute @board.valid_coordinate(:A22)
  end

  def test_if_valid_multiple_coordinates
    @board.make_cell_hash
    coordinates_1 = [:A1, :A2, :A3]

    assert @board.valid_multiple_coordinates(coordinates_1)

    coordinates_2 = [:A1, :A2, :A6]

    refute @board.valid_multiple_coordinates(coordinates_2)

    coordinates_3 = [:A1, :A2, :F3]

    refute @board.valid_multiple_coordinates(coordinates_3)
  end

  def test_all_cells_empty?
    @board.make_cell_hash
    coordinates_3 = [:C1, :C2, :C3]
    coordinates_1 = [:A1, :A2, :A3]
    coordinates_2 = [:B1, :B2]
    @board.place(@cruiser, coordinates_1)
    @board.place(@submarine, coordinates_2)

    assert @board.all_cells_empty?(coordinates_3)
    refute @board.all_cells_empty?(coordinates_1)
    refute @board.all_cells_empty?(coordinates_2)
  end

  def test_valid_placement_for_ship
    @board.make_cell_hash
    refute @board.valid_placement?(@cruiser, [:A3, :A2, :A1])
    refute @board.valid_placement?(@cruiser, [:A1, :A2, :A4])
    assert @board.valid_placement?(@cruiser, [:A1, :A2, :A3])
    refute @board.valid_placement?(@submarine, [:A1, :C1])
    refute @board.valid_placement?(@submarine, [:C1, :B1])
    refute @board.valid_placement?(@cruiser, [:A1, :B2, :C3])
    refute @board.valid_placement?(@submarine, [:C2, :D3])
    assert @board.valid_placement?(@cruiser, [:B1, :C1, :D1])
    assert @board.valid_placement?(@submarine, [:A1, :A2])
    assert @board.valid_placement?(@submarine, [:A1, :B1])
    assert @board.valid_placement?(@cruiser, [:A3, :B3, :C3])
    refute @board.valid_placement?(@cruiser, [:A2, :B3, :C3])
  end

  def test_all_letters_of_coordinates_same
    @board.make_cell_hash
    coordinates_1 = [:A1, :A2, :A3]
    assert @board.all_letters_same?(coordinates_1)
    coordinates_2 = [:A1, :A2, :A4]
    assert @board.all_letters_same?(coordinates_2)
    coordinates_3 = [:A1, :B2, :A4]
    refute @board.all_letters_same?(coordinates_3)
  end

  def test_all_letters_uniq
    @board.make_cell_hash
    coordinates_1 = [:A1, :B2, :C3, :D4]
    assert @board.all_letters_uniq?(coordinates_1)
    coordinates_2 = [:A1, :B2, :B3, :D4]
    refute @board.all_letters_uniq?(coordinates_2)
    coordinates_3 = [:A1, :C1, :D1]
    assert @board.all_letters_uniq?(coordinates_3)
  end

  def test_all_numbers_are_same
    @board.make_cell_hash
    coordinates_1 = [:A1, :B1, :C1]
    assert @board.all_numbers_same?(coordinates_1)
    coordinates_2 = [:A1, :B2, :C3]
    refute @board.all_numbers_same?(coordinates_2)
    coordinates_3 = [:A1, :B1, :D1]
    assert @board.all_numbers_same?(coordinates_3)
    coordinates_4 = [:A3, :B3, :C3]
    assert @board.all_numbers_same?(coordinates_4)
  end

  def test_numbers_are_sequential
    @board.make_cell_hash
    coordinates_1 = [:A1, :A2, :A3]
    assert @board.numbers_sequential?(coordinates_1)
    coordinates_2 = [:A1, :A2, :A4]
    refute @board.numbers_sequential?(coordinates_2)
    coordinates_3 = [:A1, :B2, :C3]
    assert @board.numbers_sequential?(coordinates_3)
    coordinates_4 = [:A3, :B2, :C1]
    refute @board.numbers_sequential?(coordinates_4)
  end

  def test_letters_are_sequential
    @board.make_cell_hash
    coordinates_1 = [:A1, :A2, :A3]
    refute @board.letters_sequential?(coordinates_1)
    coordinates_2 = [:A1, :B2, :C3]
    assert @board.letters_sequential?(coordinates_2)
    coordinates_3 = [:A1, :B1, :C1, :D1, :E1]
    assert @board.letters_sequential?(coordinates_3)
    coordinates_4 = [:E1, :D1, :C1, :B1, :A1]
    refute @board.letters_sequential?(coordinates_4)
  end

  def test_place_ship
    @board.make_cell_hash
    coordinates_1 = [:A1, :A2, :A3]
    coordinates_2 = [:B1, :B2]
    @board.place(@cruiser, coordinates_1)
    @board.place(@submarine, coordinates_2)
    sailboat = Ship.new("Sailboat", 2)
    kayak = Ship.new("Kayak", 2)
    yacht = Ship.new("Yacht", 2)

    assert @board.cells[:A1].ship == @cruiser
    assert @board.cells[:A2].ship == @cruiser
    assert @board.cells[:A3].ship == @cruiser
    assert @board.cells[:B1].ship == @submarine
    assert @board.cells[:B2].ship == @submarine
    assert @board.cells[:B3].ship == nil
    refute @board.valid_placement?(@submarine, [:A1, :A2])
    refute @board.valid_placement?(kayak, [:A3, :B3])
    assert @board.valid_placement?(sailboat, [:C3, :C4])
    assert @board.valid_placement?(kayak, [:A4, :B4])
    @board.place(yacht, [:A4, :B4])
    assert @board.cells[:A4].ship == @board.cells[:B4].ship
    refute @board.valid_placement?(sailboat, [:A4, :B4])
  end

  def test_board_render
    @board.make_cell_hash
    # @board.render
    assert_equal "   1  2  3  4 \nA 🔵 🔵 🔵 🔵 \nB 🔵 🔵 🔵 🔵 \nC 🔵 🔵 🔵 🔵 \nD 🔵 🔵 🔵 🔵 \n", @board.render

    coordinates_1 = [:A1, :A2, :A3]
    coordinates_2 = [:C4, :D4]
    @board.place(@cruiser, coordinates_1)
    @board.place(@submarine, coordinates_2)
    @board.render(true)

        assert_equal "   1  2  3  4 \nA 🚢 🚢 🚢 🔵 \nB 🔵 🔵 🔵 🔵 \nC 🔵 🔵 🔵 🚢 \nD 🔵 🔵 🔵 🚢 \n", @board.render(true)
  end

    #   1 2 3 4
    # A . . . .
    # B . . . .
    # C . . . .
    # D . . . .

end
