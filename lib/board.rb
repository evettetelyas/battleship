class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate(coordinate)
    @cells.keys.include?(coordinate)
  end

end
