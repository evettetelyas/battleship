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
    skip
  end

  def test_it_returns_false_as_default_for_sunk?
    skip
  end

  def test_it_has_hit_method
    skip
  end

  def test_hit_changes_health
    skip
  end

  def test_it_can_be_sunk_if_hit_enough
    skip
  end


end
