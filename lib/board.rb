class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
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

    num_of_uniq_num = split_coordinates.map {|c| c[1]}.uniq.length

    num_of_uniq_num == 1
  end

  def numbers_sequential?(coordinates)
    split_coordinates = coordinates.map {|coordinate|
        coordinate.to_s.chars}

    num = split_coordinates.map {|c| c[1]}

    num_i = num.map {|n| n.to_i}

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
    @show = show
    if @show == false
      return "   1  2  3  4 \n" +
      "A #{@cells[:A1].render} #{@cells[:A2].render} #{@cells[:A3].render} #{@cells[:A4].render} \n" +

      "B #{@cells[:B1].render} #{@cells[:B2].render} #{@cells[:B3].render} #{@cells[:B4].render} \n" +

      "C #{@cells[:C1].render} #{@cells[:C2].render} #{@cells[:C3].render} #{@cells[:C4].render} \n" +

      "D #{@cells[:D1].render} #{@cells[:D2].render} #{@cells[:D3].render} #{@cells[:D4].render} \n"
    elsif @show == true
      return "   1  2  3  4 \n" +
      "A #{@cells[:A1].render(true)} #{@cells[:A2].render(true)} #{@cells[:A3].render(true)} #{@cells[:A4].render(true)} \n" +

      "B #{@cells[:B1].render(true)} #{@cells[:B2].render(true)} #{@cells[:B3].render(true)} #{@cells[:B4].render(true)} \n" +

      "C #{@cells[:C1].render(true)} #{@cells[:C2].render(true)} #{@cells[:C3].render(true)} #{@cells[:C4].render(true)} \n" +

      "D #{@cells[:D1].render(true)} #{@cells[:D2].render(true)} #{@cells[:D3].render(true)} #{@cells[:D4].render(true)} \n"
    end
  end



  # def place_player_ship(ship)
  #   player_placement = []
  #   until valid_placement?(ship, player_placement)
  #     puts "Those are invalid coordinates. Please try again:"
  #     print "> "
  #   end
  #   place(ship, player_placement)
  # end
    # split_coordinates = @cells.keys.map {|coordinate|
    #     coordinate.to_s.chars}
    #
    # num_ary = split_coordinates.map {|c| c[1]}.uniq
    # num_times = num_ary.sort.last.to_i
    # # letter_ary = split_coordinates.map {|c| c[0]}.uniq
    # id_strings = @cells.keys.collect {|symbol| symbol.to_s}
    #
    # render_output = "  "
    #
    # render_output += (num_ary.join(" ") + " \n") + "A "
    #
    # row_output = num_times.times do
    #   @cells.each do |cell|
    #     p @cells[].render
    #   end
    # end
    #
    # a_spaces = id_strings.select {|id| id.include?("A")}
    # a_spaces_symbols = a_spaces.map {|id| id.to_sym}
    #
    # b_spaces = id_strings.select {|id| id.include?("B")}
    # b_spaces_symbols = b_spaces.map {|id| id.to_sym}
    #
    # c_spaces = id_strings.select {|id| id.include?("C")}
    # c_spaces_symbols = c_spaces.map {|id| id.to_sym}
    #
    # d_spaces = id_strings.select {|id| id.include?("D")}
    # d_spaces_symbols = d_spaces.map {|id| id.to_sym}

end
