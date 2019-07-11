require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @player_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_submarine = Ship.new("Submarine", 2)
    @game = Game.new(@computer_board, @player_board)
    @computer_board.make_cell_hash
    @player_board.make_cell_hash
  end

  def test_game_exist

    assert_instance_of Game, @game
  end

  def test_access_boards
    assert_equal @computer_board, @game.comp_board
    assert_equal @player_board, @game.player_board
  end

  def test_can_place_computer_ships
    assert @computer_board.all_cells_empty?([:A1, :A2, :A3, :A4, :B1, :B2, :B3, :B4, :C1, :C2, :C3, :C4,:D1, :D2, :D3, :D4])

    @game.place_all_comp_ships

    refute @computer_board.all_cells_empty?([:A1, :A2, :A3, :A4, :B1, :B2, :B3, :B4, :C1, :C2, :C3, :C4,:D1, :D2, :D3, :D4])
  end

  def test_place_player_ships
    assert @player_board.all_cells_empty?([:A1, :A2, :A3, :A4, :B1, :B2, :B3, :B4, :C1, :C2, :C3, :C4,:D1, :D2, :D3, :D4])

    @game.place_player_ships

    refute @player_board.all_cells_empty?([:A1, :A2, :A3, :A4, :B1, :B2, :B3, :B4, :C1, :C2, :C3, :C4,:D1, :D2, :D3, :D4])
  end
end
