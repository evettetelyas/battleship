class DynamicBoard
attr_reader :x_axis, :y_axis, :height, :width, :letters_numbers, :cell

  def initialize
    @height = height
    @x_axis = []
    @width = width
    @y_axis = []
    @letters_numbers = {A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, I: 9, J: 10, K: 11, L: 12, M: 13, N: 14, O: 15, P: 16, Q: 17, R: 18, S: 19, T: 20, U: 21, V: 22, W: 23, X: 24, Y: 25, Z: 26}
    @cell = Hash.new
  end

  def set_size
    puts "Add the dimensions of your board:"
    print "Height: "
    @height = gets.chomp.to_i
    print "Width: "
    @width = gets.chomp.to_i
  end

  def set_y_axis_grid_coordinate_array
    @y_axis = (1..@height).to_a
  end

  def set_x_axis_grid_coordinate_array
    x_axis_data = (1..@width).to_a
    @x_axis = x_axis_data.map {|num| @letters_numbers.invert[num].to_s}
  end

  def create_cells
    @x_axis.each do |letter|
    @y_axis.each do |number|
      letternum = "#{letter}#{number}"
      @cell[letternum] = Cell.new(letternum)
      end
    end
  end


  end
