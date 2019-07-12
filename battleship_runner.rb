require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'
require 'colorize'

loop do

  puts "\n\n\n\u{1F6A2 1F4A3 1F4A6}WELCOME TO BATTLESHIP\u{1F4A6 1F4A3 1F6A2}".colorize(:light_blue)
  puts "Enter p to play. Enter q to quit"
  print "> "
  answer = gets.chomp.downcase
  until answer == "p" || answer == "q"
    puts "that's not valid, please try again!"
    puts "Enter p to play. Enter q to quit"
    print "> "
    answer = gets.chomp.downcase
  end

  if answer == "q"
    puts "Goodbye!"
    exit
  end

  puts "\nAdd the dimensions of your board:"
  print "Height: "
  height = gets.chomp.to_i
  print "Width: "
  width = gets.chomp.to_i

  if height < 4 || width < 4
    puts "\nBoth height and width must be at least 4 cells. Automatically set to 4x4 board."
    height = 4
    width = 4

  elsif height > 10 || width > 10
    puts "\nYour board is too big. Both height and width must be 10 cells or less. Automatically set to 10x10 board."
    height = 10
    width = 10

  elsif height.between?(4,10) && width.between?(4,10)
    puts "\nGreat! You are all set with a #{height}x#{width} board!"

  else puts "\nThat's not a valid input, please try again:"
    print "Height: "
    height = gets.chomp.to_i
    print "Width: "
    width = gets.chomp.to_i
  end

  lesser_value = nil
  if height > width
    lesser_value = width
  else lesser_value = height
  end

  computer_board = Board.new(height, width)
  player_board = Board.new(height, width)
  game = Game.new(computer_board, player_board)

  puts "\n\nNow, let's set up the ships!"
  puts "How many ships do you want to create?"
  print "> "
  ship_num = gets.chomp.to_i

  until ship_num.between?(1,lesser_value - 1)
    puts "you can only place between 1 and #{lesser_value - 1} ships. Pick again!"
    print "> "
    ship_num = gets.chomp.to_i
  end

  puts "\n\nCool, we'll set up #{ship_num} ships!"

  ship_num.times do |ship_number|
    puts "\nLet's set up ship number #{ship_number+1}."
    puts "Name ship number #{ship_number+1}:"
    print "> "
    ship_name = gets.chomp.capitalize

    puts "How many cells will the #{ship_name} take?"
    print "> "
    ship_health = gets.chomp.to_i
    until ship_health.between?(1,9)
      puts "You can only pick between 1 and 9 cells!"
      ship_health = gets.chomp.to_i
    end
    if ship_health > 9
      puts "Max ship length is 9 units. Your ship is automatically set to 5 units."
      ship_health = 4
    elsif ship_health > (height || width)
      puts "Your ship is longer than your board! Your ship is automatically set to 3 units."
      ship_health = 3
    end

    game.player_ships[ship_name] = Ship.new(ship_name, ship_health)
    game.comp_ships[ship_name] = Ship.new(ship_name, ship_health)
  end

  computer_board.make_cell_hash
  player_board.make_cell_hash
  game.place_all_comp_ships
  game.place_player_ships
  game.turn
  game.final_results
end
