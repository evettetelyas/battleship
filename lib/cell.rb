require 'colorize'
class Cell
  attr_reader :coordinate, :ship, :fired_upon, :render, :number_of_shots

  def initialize(coordinate, ship = nil, fired_upon = false, render = "." )
    @coordinate = coordinate
    @ship = ship
    @fired_upon = fired_upon
    @render = render
    @number_of_shots = 0
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if !empty?
      @ship.hit
      @number_of_shots += 1
      @fired_upon = true
    else
      @fired_upon = true
      @number_of_shots += 1
    end
  end

  def render(show = false)
    @show = show
    if !fired_upon && !empty?
      if @show == true
        return "S".colorize(:light_blue)
      else
        return ".".colorize(:light_blue)
      end
    elsif !fired_upon && empty?
      return ".".colorize(:light_blue)
    elsif fired_upon? && empty?
      return "M".colorize(:light_blue)
    elsif fired_upon? && !empty? && !@ship.sunk?
      return "H".colorize(:red)
    elsif fired_upon? && @ship.sunk?
      return "X".colorize(:black ).colorize(:background => :red)
    end
  end

  def render_output
    if fired_upon? && empty?
      return "was a miss."
    elsif fired_upon? && !empty? && !@ship.sunk?
      return "was a hit!"
    elsif fired_upon? && !empty? && @ship.sunk?
      return "sunk the ship!"
    end
  end

 end
