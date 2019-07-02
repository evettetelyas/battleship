class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coodinate, ship = nil, fired_upon = false )
    @coodinate = coodinate
    @ship = ship
    @fired_upon = fired_upon
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
    @ship.hit
    @fired_upon = true
    # @ship.health -= 1
    # @fired_upon = true
  end

#   def render
#     if @fired_upon = false
#       "."
#     elsif
#       @fired_upon = true && @ship = nil
#         "M"
#     elsif
#       @fired_upon = true && @ship != nil
#         "H"
#     elsif
#       @ship.health = 0
#       "X"
#     end
#   end
 end
