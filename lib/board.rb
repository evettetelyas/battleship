class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    # split_coordiates = coordinates.map {|coordinate|
    #   coordinate.to_s.split("")}

    if ship.length == coordinates.count
      #&& split_coordiates
      true

    else
      false
    end

  end

end
