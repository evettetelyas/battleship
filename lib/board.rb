class Board
  attr_reader :cells, :num_let, :num_num

  def initialize(num_let = 4, num_num = 4)
    @cells = {}
    @num_let = ("A".."J").to_a[0..num_let-1]
    @num_num = ("1".."10").to_a[0..num_num-1]
  end

  def make_cell_keys
    @num_let.map do |let|
      @num_num.map do |num|
        (let + num).to_sym
      end
    end.flatten
  end

  def make_cell_hash
    make_cell_keys.map do |key|
      @cells[key] = Cell.new(key)
    end
  end

  def valid_coordinate(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_multiple_coordinates(coordinates)
    coordinates.all? do |coordinate|
      @cells.keys.include?(coordinate)
    end
  end

  def all_cells_empty?(coordinates)
      coordinates.all? do |coordinate|
      @cells[coordinate].empty?
    end
  end

  def valid_placement?(ship, coordinates)
    if !valid_multiple_coordinates(coordinates)
      return false
    elsif
      !all_cells_empty?(coordinates)
      return false
    elsif
      all_letters_same?(coordinates) && numbers_sequential?(coordinates) && ship.length == coordinates.count
      return true
    elsif
      all_letters_uniq?(coordinates) && all_numbers_same?(coordinates) && letters_sequential?(coordinates) && ship.length == coordinates.count
      return true
    end
  end

  def split_coordinates(coordinates)
    @split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}
  end

  def all_letters_same?(coordinates)
    split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}

    num_of_uniq_letter = split_coordinates.map {|c| c[0]}.uniq.length

    num_of_uniq_letter == 1
  end

  def all_letters_uniq?(coordinates)
    split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}

    num_of_uniq_letter = split_coordinates.map {|c| c[0]}.uniq.length

    num_of_uniq_letter == split_coordinates.count
  end

  def all_numbers_same?(coordinates)
    split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}

    num_of_uniq_num = split_coordinates.map {|c| c[1..-1].join}.uniq.length

    num_of_uniq_num == 1
  end

  def numbers_sequential?(coordinates)
    split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}

    num = split_coordinates.map {|c| c[1..-1]}

    num_i = num.map {|n| n.join.to_i}

    num_i.each_cons(2).all? {|first, second| second == first + 1}
  end

  def letters_sequential?(coordinates)
    split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}

    let = split_coordinates.map { |c| c[0] }

    let_ord = let.map { |l| l.ord}

    let_ord.each_cons(2).all? { |first, second| second == first + 1 }
  end

  def place(ship, coordinates)
    coordinates.map {|coordinate| @cells[coordinate].place_ship(ship)}
  end

  def place_comp_ship(ship)
    comp_placement = []
    until valid_placement?(ship, comp_placement)
      comp_placement = @cells.keys.sample(ship.length)
    end
    place(ship, comp_placement)
  end

  def render(show = false)
    return "   " +
    @num_num.map do |num|
      num + "  "
    end.join + "\n" +

    @num_let.map do |let|
      let + @cells.keys.map do |key|
        if key.to_s.include?(let)
          " " + @cells[key].render(show)
        end
      end.join + " \n"
    end.join
  end
end
