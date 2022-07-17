class Game
  attr_reader :player_board, :computer_board, :player_cruiser, :player_sub, :comp_cruiser, :comp_sub, :comp_coordinates, :valids

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
    # @comp_coordinates = computer_board.cells.keys.sample(3)
    @valids = []
  end

  def main_menu
    puts "Welcome to BATTLESHIP!"
    puts "Enter p to play. Enter q to quit."
    player_input = gets.chomp
    if player_input.downcase == "p"
      start
    elsif player_input.downcase == "q"
      puts "Goodbye!"
      exit
    else
      puts "Input invalid..."
      main_menu
    end
  end

  def start
    until player_cruiser.sunk? && player_sub.sunk || comp_cruiser.sunk? && comp_sub.sunk?

    computer_board.render
    player_board.render

  # def place_computer_cruiser
    loop do computer_board.cells.keys.sample(3)
      if computer_board.valid_placement?(@comp_cruiser, computer_board.cells.keys.sample(3))
        placement_cells = computer_board.cells.keys.sample(3)
        computer_board.place(@comp_cruiser, placement_cells)
        break
      end
    end
  end
  # end
    # until computer_board.valid_placement?(comp_cruiser, @valids)
    #   @valids = computer_board.cells.keys.sample(3)
    # end
    #

    # comp_coordinates = computer_board.cells.keys.sample(3)

    # until ship.valid_placement?(comp_cruiser, comp_coordinates)
    #   comp_coordinates << placement_options.sample(3)
    # end
    computer_board.place(comp_cruiser, comp_coordinates)
  end
end
