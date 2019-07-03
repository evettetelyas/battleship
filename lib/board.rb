class Board
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate(coordinate)
    @cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)

    ship.length == coordinates.count
  end

  def all_letters_same?(coordinates)

    split_coordinates = coordinates.map do |coordinate|
        coordinate.to_s.split("")
      end

    num_of_uniq_letter = split_coordinates.map { |c| c[0] }.uniq.length

    if num_of_uniq_letter == 1
      true
    else
      false
    end
  end

  def all_numbers_same?(coordinates)

    split_coordinates = coordinates.map do |coordinate|
        coordinate.to_s.split("")
      end

    num_of_uniq_num = split_coordinates.map { |c| c[1] }.uniq.length

    if num_of_uniq_num == 1
      true
    else
      false
    end
  end


end

    #split_coordinates_number = split_coordinates.map do |coord|
        #coord[1]


  #sequencial_number = split_coordinates_number.each_cons(2).all? { |first, second| second == first + 1 }

  #   split_coordinates = coordinates.map do |coordinate|
  #     coordinate.to_s.split("")
  #   end
  #
  #   split_coordinates_number = split_coordinates.map do |coord|
  #     coord[1]
  #   end
  #
  #   split_coordinates_to_determine_if_all_same_letter = split_coordinates.map do |coord|
  #     coord[0]
  #   end.uniq.length
  #
  #   split_coordinate_number_to_determine_if_all_same = split_coordinates_number.uniq.length
  #
  #   split_coordinates_to_determine_if_all_different_letter = split_coordinates.map do |coord|
  #     coord[0]
  #   end.uniq.length
  #
  #   if split_coordinates_to_determine_if_all_same_letter == 1
  #     if split_coordinates_number.each_cons(2).all? do |first, second|
  #       second == first + 1
  #       if ship.length == coordinates.count
  #         true
  #       end
  #     end
  #   elsif split_coordinates_to_determine_if_all_same_letter == split_coordinates.count
  #     if split_coordinate_number_to_determine_if_all_same == 1
  #       if ship.length == coordinates.count
  #         true
  #       end
  #     end
  #   else
  #       false
  #     end
  #   end
  # end

  #   split_coordinates = coordinates.map {|coordinate|
  #     coordinate.to_s.split("")}
  #   split_coordinates = coordinates.map do |coordinate|
  #     coordinate.to_s.split("")
  #   end
  #   #this tells us if all the letters are the same if it is = 1
  #   split_coordinates_to_determine_if_all_same_letter = split_coordinates.map do |coord|
  #     coord[0]
  #   end.uniq.length
  #   #this returns array with just the numbers
  #   split_coordinates_number = split_coordinates.map do |coord|
  #     coord[1]
  #   end
  #
  #   if ship.length == coordinates.count
  #     if split_coordinates_to_determine_if_all_same_letter == 1
  #       #this will tell us if it increments by one, return true or false
  #       if split_coordinates_number.each_cons(2).all? do |first, second|
  #         second == first + 1
  #       end
  #     end
  #     #&& split_coordinates
  #     true
  #   end
  #   else
  #     false
  #   end
  # end
