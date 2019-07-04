class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_multiple_coordinates(coordinates)
    coordinates.each do |coordinate|
      @cells.keys.include?(coordinate)
    end
  end

  def all_cells_empty?(coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def valid_placement?(ship, coordinates)
    return false unless valid_multiple_coordinates(coordinates)
    return false unless all_cells_empty?(coordinates)
    if all_letters_same?(coordinates) && numbers_sequential?(coordinates) && ship.length == coordinates.count
      true
    elsif all_letters_uniq?(coordinates) && all_numbers_same?(coordinates) && letters_sequential?(coordinates) && ship.length == coordinates.count
      true
    else
      false
    end
  end

  def all_letters_same?(coordinates)
    split_coordinates = coordinates.map do |coordinate|
        coordinate.to_s.split("")
      end

    num_of_uniq_letter = split_coordinates.map { |c| c[0] }.uniq.length

    num_of_uniq_letter == 1
  end

  def all_letters_uniq?(coordinates)
    split_coordinates = coordinates.map do |coordinate|
        coordinate.to_s.split("")
      end

    num_of_uniq_letter = split_coordinates.map { |c| c[0] }.uniq.length

    num_of_uniq_letter == split_coordinates.count
  end

  def all_numbers_same?(coordinates)
    split_coordinates = coordinates.map do |coordinate|
        coordinate.to_s.split("")
      end

    num_of_uniq_num = split_coordinates.map { |c| c[1] }.uniq.length

    num_of_uniq_num == 1
  end

  def numbers_sequential?(coordinates)
    split_coordinates = coordinates.map { |coordinate|
        coordinate.to_s.split("") }

    num = split_coordinates.map { |c| c[1] }

    num_i = num.map { |n| n.to_i }

    num_i.each_cons(2).all? { |first, second| second == first + 1 }
  end

  def letters_sequential?(coordinates)
    split_coordinates = coordinates.map { |coordinate|
        coordinate.to_s.split("") }

    let = split_coordinates.map { |c| c[0] }

    let_ord = let.map { |l| l.ord}

    let_ord.each_cons(2).all? { |first, second| second == first + 1 }
  end

  def place(ship, coordinates)
    coordinates.map {|coordinate| @cells[coordinate].place_ship(ship)}
  end

end
