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
  # @comp_board.place_comp_ship(@comp_ships[:cruiser])
comp_ships.keys.each {|key| @comp_board.place_comp_ship(@comp_ships[key])}

end


end
