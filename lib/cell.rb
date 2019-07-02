class Cell
  attr_reader :coordinate, :ship, :fired_upon, :render

  def initialize(coodinate, ship = nil, fired_upon = false, render = "." )
    @coodinate = coodinate
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
<<<<<<< HEAD
   if !fired_upon
       "."
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && !empty? && !@ship.sunk?
      "H"
    elsif fired_upon? && @ship.sunk?
      "X"
=======
    if !fired_upon
      return "."
    elsif fired_upon? && empty?
      return "M"
    elsif fired_upon? && !empty? && !@ship.sunk?
      return "H"
    elsif fired_upon? && @ship.sunk?
      return "X"
>>>>>>> 7e5d7060592c1fd8ad91c5132a9b559f92e74aea
    end
  end
 end
