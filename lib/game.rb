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

  if answer == "q"
    puts "Goodbye!"
  elsif answer == "p"
  end
end

def place_all_comp_ships
  comp_ships.keys.each {|key| @comp_board.place_comp_ship(@comp_ships[key])}
end

def place_player_cruiser
  puts "I have laid out my ships on the grid. You now need to lay your two ships. The Cruiser is three units long, and the Submarine is two uits long."
  puts @player_board.render
  puts "Enter the squares for your Cruiser (3 spaces)"
  print "> "

  coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}

  until @player_board.valid_placement?(@player_ships[:cruiser], coordinates)
    puts "Those are invalid coordinates. Please try again:"
    coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}
  end
  @player_board.place(@player_ships[:cruiser], coordinates)
  puts @player_board.render
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
  puts @player_board.render
end

end