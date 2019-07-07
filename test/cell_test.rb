require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @ship = Ship.new("Cruiser", 3)
    @cell = Cell.new("B4")
  end

  def test_it_exists

    assert_instance_of Cell, @cell
  end

  def test_ship_method_returns_nil

    assert_nil @cell.ship
  end

  def test_it_has_true_for_empty?

    assert_equal true, @cell.empty?
  end

  def test_can_place_ship_and_empty?
    @cell.place_ship(@ship)

    assert_equal false, @cell.empty?
  end

  def test_it_can_be_fired_on
    @cell.place_ship(@ship)

    assert_equal false, @cell.fired_upon?

    @cell.fire_upon

    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_shows_ship_with_s
    @cell.place_ship(@ship)


    assert_equal "S", @cell.render(true)
  end

  def test_render_works
    assert_equal ".", @cell.render

    @cell.place_ship(@ship)

    assert_equal "S", @cell.render(true)
    assert_equal ".", @cell.render

    cell = Cell.new("C4")
   cell.fire_upon

    assert_equal "M", cell.render

    @cell.place_ship(@ship)

    assert_equal "S", @cell.render(true)
    assert_equal ".", @cell.render

    @cell.fire_upon

    assert_equal "H", @cell.render
    assert_equal 2, @ship.health

    2.times {@cell.fire_upon}
    assert_equal "X", @cell.render
  end
end
