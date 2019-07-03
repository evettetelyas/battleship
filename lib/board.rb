class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false unless all_cells_on_board?(@cells)
    return false unless all_cells_empty?(@cells)
    return false unless ship.length == coordinates.count
    if all_letters_same?(coordinates) && numbers_sequential?(coordinates)
      true
    elsif all_numbers_same?(coordinates) && letters_sequential?(coordinates)
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
    split_coordinates = coordinates.map do |coordinate|
      coordinate.to_s.chars
    end

    # this will break for boards 10x10 or bigger
    num_i = split_coordinates.map { |c| c[1].to_i }

    # num_i = num.map { |n| n.to_i }

    num_i.each_cons(2).all? { |first, second| second == first + 1 }
  end

  def letters_sequential?(coordinates)
    split_coordinates = coordinates.map do |coordinate|
      coordinate.to_s.chars
    end

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
