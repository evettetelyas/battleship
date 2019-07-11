class Ship
  attr_reader :name, :length, :health, :sunk

  def initialize(name, length, sunk = false)
    @name = name
    @length = length
    @health = length
    @sunk = sunk
  end

  def sunk?
    if @health > 0
      false
    else
      true
    end
  end

  def hit
    @health -= 1
  end
end
