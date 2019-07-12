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

  def make_cell_keys_2
    @num_num.map do |num|
      @num_let.map do |let|
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
      false
    elsif
      !all_cells_empty?(coordinates)
      false
    elsif
      valid_vertical_placement?(ship, coordinates)
      true
    elsif
      valid_horizontal_placement?(ship, coordinates)
      true
    end
  end

  def valid_vertical_placement?(ship, coordinates)
    return true if all_letters_uniq?(coordinates) && all_numbers_same?(coordinates) && letters_sequential?(coordinates) && ship.length == coordinates.count
  end

  def valid_horizontal_placement?(ship, coordinates)
    return true if all_letters_same?(coordinates) && numbers_sequential?(coordinates) && ship.length == coordinates.count
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
    placement_1 = []
    until valid_placement?(ship, placement_1)
    comp_place_first = @cells.keys.sample(1).join.to_sym
    v_h = [0, 1].sample
      if v_h == 0
        placement_1 = make_cell_keys.slice(make_cell_keys.index(comp_place_first)..(make_cell_keys.index(comp_place_first) + ship.length-1))
      elsif v_h == 1
        placement_1 = make_cell_keys_2.slice(make_cell_keys_2.index(comp_place_first)..(make_cell_keys_2.index(comp_place_first) + ship.length-1))
      end
    end
    place(ship, placement_1)
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
