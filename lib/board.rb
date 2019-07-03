class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate(coordinates)
    
  end

  def all_cells_empty?(coordinates)

  end

  def valid_placement?(ship, coordinates)
    return false unless valid_coordinate(coordinates)
    return false unless all_cells_empty?(coordinates)
    return false unless ship.length == coordinates.count
    return false unless (all_letters_same?(coordinates) && numbers_sequential?(coordinates)) || (all_numbers_same?(coordinates) && letters_sequential?(coordinates))
  end

  def all_letters_same?(coordinates)
    split_coordinates = coordinates.map {|coordinate| coordinate.to_s.chars}

    num_of_uniq_letter = split_coordinates.map { |c| c[0] }.uniq.length

    num_of_uniq_letter == 1
  end

  def all_letters_uniq?(coordinates)
    split_coordinates = coordinates.map {|coordinate| coordinate.to_s.chars}

    num_of_uniq_letter = split_coordinates.map { |c| c[0] }.uniq.length

    num_of_uniq_letter == split_coordinates.count
  end

  def all_numbers_same?(coordinates)
    split_coordinates = coordinates.map {|coordinate| coordinate.to_s.chars}

    num_of_uniq_num = split_coordinates.map { |c| c[1] }.uniq.length

    num_of_uniq_num == 1
  end

  def numbers_sequential?(coordinates)
    split_coordinates = coordinates.map {|coordinate| coordinate.to_s.chars}

    # this will break for boards 10x10 or bigger
    num_i = split_coordinates.map { |c| c[1].to_i }

    # num_i = num.map { |n| n.to_i }

    num_i.each_cons(2).all? { |first, second| second == first + 1 }
  end

  def letters_sequential?(coordinates)
    split_coordinates = coordinates.map {|coordinate| coordinate.to_s.chars}

    let_ord = split_coordinates.map { |c| c[0].ord }

    # let_ord = let.map { |l| l.ord}
    #could sort to order letters backwards
    let_ord.each_cons(2).all? { |first, second| second == first + 1 }
  end

  # def place (ship, coordinates)
  #   coordinates.map do |coord|
  #     if coord == @cells.key
  #       @cells[coord] = ship
  #     end
  #   end
  # end

end
