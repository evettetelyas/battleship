require 'colorize'

class Game
  attr_reader :comp_board, :player_board
  attr_accessor :comp_ships, :player_ships

  def initialize(comp_board, player_board)
    @comp_board = comp_board
    @player_board = player_board
    @comp_ships = {}
    @player_ships = {}
  end

  def place_all_comp_ships
    @comp_ships.keys.each {|key| @comp_board.place_comp_ship(@comp_ships[key])}
  end

  def place_player_ships
    puts "\n\nI have laid out my ships on the grid. You now need to lay your two ships."
    puts @player_board.render

    @player_ships.values.each do |ship|
      ready_to_place = false
      until ready_to_place
        puts "\nEnter the coordinates for your #{ship.name} (#{ship.health} spaces)"
        print "> "
        coordinates = (gets.chomp.upcase.split(" ")).map {|cell| cell.to_sym}

        if @player_board.valid_placement?(ship, coordinates)
          ready_to_place = true
        else
          puts "those coordinates were not valid, try again"
        end
      end
    @player_board.place(ship, coordinates)
    puts @player_board.render(true)
    end
  end

  def all_ships_sunk?
    @comp_ships.values.all? {|ship| ship.sunk?} || @player_ships.values.all? {|ship| ship.sunk?}
  end


  def turn
    until all_ships_sunk?
      puts "=============COMPUTER BOARD============="
      puts @comp_board.render
      puts "=============PLAYER BOARD============="
      puts @player_board.render(true)

      answer = nil

      ready_to_fire = false
      while !ready_to_fire
        puts "\nEnter the coordinate for your shot"
        print "> "
        answer = gets.chomp.upcase.to_sym

        if !@comp_board.valid_coordinate(answer)
          puts "That is not a valid coordinate, please try again:"

        elsif @comp_board.cells[answer].number_of_shots >= 1
          puts "You have already fired on #{answer}. Try again:"
        else
          ready_to_fire = true
        end
      end

      @comp_board.cells[answer].fire_upon


      random_hit_ary = []
      random_hit_ary = @player_board.cells.keys.select {|cell| @player_board.cells[cell].number_of_shots < 1}

      @random_hit = random_hit_ary.sample

      @player_board.cells[@random_hit].fire_upon

      puts "\n\n\nYour shot on #{answer.upcase.to_s} #{@comp_board.cells[answer].render_output}"
      puts "My shot on #{@random_hit.upcase.to_s} #{@player_board.cells[@random_hit].render_output}"
    end

    puts "=============FINAL COMPUTER BOARD============="
    puts @comp_board.render(true)
    puts "=============FINAL PLAYER BOARD============="
    puts @player_board.render(true)
  end

  def final_results
    if @comp_ships.values.all? {|ship| ship.sunk?}
      puts "\n\n\u{1F3C6 1F3C6}You won!\u{1F3C6 1F3C6}\n\n".colorize(:magenta)
    elsif @player_ships.values.all? {|ship| ship.sunk?}
      puts "\n\n\u{1F3C6 1F3C6}I won!\u{1F3C6 1F3C6}\n\n".colorize(:magenta)
    end
  end
end
