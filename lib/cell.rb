class Cell
  attr_reader :coordinate, :ship, :fired_upon, :render

  def initialize(coordinate, ship = nil, fired_upon = false, render = "." )
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
    @render = render
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !empty?
      @ship.hit
      @fired_upon = true
    else
      @fired_upon = true
    end
  end

  def render
    if !fired_upon && empty?
      return "."
    elsif !fired_upon && !empty?
      return "S"
    elsif fired_upon? && empty?
      return "M"
    elsif fired_upon? && !empty? && !@ship.sunk?
      return "H"
    elsif fired_upon? && @ship.sunk?
      return "X"
    end
  end
 end
