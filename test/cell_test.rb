require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  def test_it_exists

    assert_instance_of Cell, @cell
  end

  def test_ship_method_returns_nil

    assert_equal nil, @cell.ship
  end

  def test_it_has_true_for_empty?

    assert_equal true, @cell.empty?
  end

  def test_can_place_ship_and_empty?
    @cell.place_ship(@cruiser)

    assert_equal false, @cell.empty?
  end
end
