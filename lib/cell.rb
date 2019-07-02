class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coodinate, ship = nil, fired_upon = false )
    @coodinate = coodinate
    @ship = nil
    @fired_upon = fired_upon
    @space = ""
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
    if @ship != nil
      @ship.hit
      @fired_upon = true
    end
    @ship.health - 1
    # @fired_upon = true
  end

  def render
    # if @fired_upon = false
    #   "."
    if
      @fired_upon = true && @ship == nil
        @space = "M"
    end
    # elsif
    #   @fired_upon = true && @ship != nil
    #     "H"
    # elsif
    #   @ship.health = 0
    #   {}"X"
    @space
  end
 end
