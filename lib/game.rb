require 'colorize'

class Game
  attr_reader :comp_board, :player_board, :comp_ships, :player_ships

  def initialize(comp_board, player_board)
    @comp_board = comp_board
    @player_board = player_board
    @comp_ships = {cruiser: Ship.new("Cruiser", 3), submarine: Ship.new("Submarine", 2)}
    @player_ships = {cruiser: Ship.new("Cruiser", 3), submarine: Ship.new("Submarine", 2)}
  end

  def start

      puts "Welcome to BATTLESHIP"
      puts "Enter p to play. Enter q to quit"
      print "> "

      answer = gets.chomp.downcase
      until answer == "p" || answer == "q"
          puts "that's not valid, please try again!"
          puts "Enter p to play. Enter q to quit"
          print "> "
          answer = gets.chomp.downcase
        end
      if answer == "p"
        place_all_comp_ships
      elsif answer == "q"
        puts "Goodbye!"
        exit
      end
    end

  def place_all_comp_ships
    @comp_ships.keys.each {|key| @comp_board.place_comp_ship(@comp_ships[key])}
  end

  def place_player_cruiser
    puts "I have laid out my ships on the grid. You now need to lay your two ships. The Cruiser is three units long, and the Submarine is two units long."
    puts @player_board.render
    puts "Enter the squares for your Cruiser (3 spaces)"
    print "> "

    coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}

    until @player_board.valid_placement?(@player_ships[:cruiser], coordinates)
      puts "Those are invalid coordinates. Please try again:"
      coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}
    end
    @player_board.place(@player_ships[:cruiser], coordinates)
    puts @player_board.render(true)
  end

  def place_player_submarine
    puts "Enter the squares for your Submarine (2 spaces)"
    print "> "

    coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}

    until @player_board.valid_placement?(@player_ships[:submarine], coordinates)
      puts "Those are invalid coordinates. Please try again:"
      coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}
    end
    @player_board.place(@player_ships[:submarine], coordinates)
    puts @player_board.render(true)
  end

  # def turn
  #   puts "=" * 12 + "COMPUTER BOARD" + "=" * 12
  #   puts @comp_board.render
  #   puts "=" * 12 + "PLAYER BOARD" + "=" * 12
  #   puts @player_board.render(true)
  #
  #   puts "What space would you like to fire on?"
  #   puts " >"
  #
  #   answer = gets.chomp.upcase.to_sym
  #   @comp_board.cells[answer].fire_upon
  # end

  def all_ships_sunk?
    @comp_ships.values.all? {|ship| ship.sunk?} || @player_ships.values.all? {|ship| ship.sunk?}
  end


def turn
  until all_ships_sunk?
    puts "=============COMPUTER BOARD============="
    puts @comp_board.render
    puts "=============PLAYER BOARD============="
    puts @player_board.render(true)

    puts "\nEnter the coordinate for your shot"
    print "> "

    answer = gets.chomp.upcase.to_sym

    until @comp_board.valid_coordinate(answer)
      puts "That is not a valid coordinate, please try again:"
      print "> "
      answer = gets.chomp.upcase.to_sym
    end

    @comp_board.cells[answer].fire_upon
    random_hit = @player_board.cells.keys.sample
    @player_board.cells[random_hit].fire_upon

    puts "\n\n\nYour shot on #{answer.upcase.to_s} #{@comp_board.cells[answer].render_output}"
    puts "My shot on #{random_hit.upcase.to_s} #{@player_board.cells[random_hit].render_output}"
  end
  puts "=============FINAL COMPUTER BOARD============="
  puts @comp_board.render
  puts "=============FINAL PLAYER BOARD============="
  puts @player_board.render(true)
end

def final_results
  if @comp_ships.values.all? {|ship| ship.sunk?}
    puts "\n\nYou won!".colorize(:magenta)
  elsif @player_ships.values.all? {|ship| ship.sunk?}
    puts "\n\nI won!".colorize(:magenta)
  end
end

end
