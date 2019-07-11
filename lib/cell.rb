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
        # return "S".colorize(:light_blue)
        return "\u{1F6A2}"
      else
        # return ".".colorize(:light_blue)
        return "\u{1F535}"
      end
    elsif !fired_upon && empty?
      # return ".".colorize(:light_blue)
      return "\u{1F535}"
    elsif fired_upon? && empty?
      # return "M".colorize(:light_blue)
      return "\u{1F518}"
    elsif fired_upon? && !empty? && !@ship.sunk?
      # return "H".colorize(:red)
      return "\u{1F4A5}"
    elsif fired_upon? && @ship.sunk?
      # return "X".colorize(:black).colorize(:background => :red)
      return "\u{1F480}"
    end
  end

  def render_output
    if fired_upon? && empty?
      return "was a miss."
    elsif fired_upon? && !empty? && !@ship.sunk?
      return "hit the #{@ship.name}!"
    elsif fired_upon? && !empty? && @ship.sunk?
      return "sunk the #{@ship.name}!"
    end
  end
 end
