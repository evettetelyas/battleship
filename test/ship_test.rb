require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'


class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_a_name
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
  end

  def test_it_has_a_length
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.length
  end

  def test_it_has_health
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
  end

  def test_it_returns_false_as_default_for_sunk?
    cruiser = Ship.new("Cruiser", 3)

    refute cruiser.sunk?
  end

  def test_it_has_hit_method_and_changes_health_dynamically
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit

    assert_equal 2, cruiser.health

    cruiser.hit
    assert_equal 1, cruiser.health

    cruiser.hit
    assert_equal 0, cruiser.health
  end

  def test_it_can_be_sunk_if_hit_enough
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    assert cruiser.sunk?
  end

end
