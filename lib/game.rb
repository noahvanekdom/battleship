class Game
  attr_reader :player_board, :cpu_board, :player_cruiser,
              :player_sub, :cpu_cruiser, :cpu_sub

  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @cpu_cruiser = Ship.new("Cruiser", 3)
    @cpu_sub = Ship.new("Submarine", 2)
  end

  def main_menu
    puts "Welcome to BATTLESHIP!"
    puts "Enter p to play. Enter q to quit."
    player_input = gets.chomp.downcase
    if player_input == "p"
      start
    elsif player_input == "q"
      puts "Goodbye!"
      exit
    else
      puts "Input invalid..."
      main_menu
    end
  end

  def start
    @cpu_board.render
    @player_board.render

    place_cpu_ships
    place_user_ships
  end


  def cpu_placement_coordinates(ship, board)
    cpu_placement_coordinates_array = []
    until cpu_placement_coordinates_array != [] do
    working_coordinates = @cpu_board.cells.keys.sample(ship.length)
      if board.valid_placement?(ship, working_coordinates)
      cpu_placement_coordinates_array = working_coordinates
      end
    end
    return cpu_placement_coordinates_array
  end

  def place_cpu_ships
    @cpu_board.place(@cpu_cruiser, cpu_placement_coordinates(@cpu_cruiser, @cpu_board))
    @cpu_board.place(@cpu_sub, cpu_placement_coordinates(@cpu_sub, @cpu_board))
    puts "I've placed my ships, now do your best to fool me -- input the coordinates for your cruiser in order"
  end

  def get_user_coordinates(ship, board)
    user_coordinates = []
    until board.valid_placement?(ship, user_coordinates) do
      user_coordinates = gets.chomp.upcase.split(" ")
      unless board.valid_placement?(ship, user_coordinates)
        puts "Those are invalid coordinates. Please try again:"
      end
    end
    user_coordinates
  end

  def place_user_ships
    puts "Enter the squares for the Cruiser (3 consecutive spaces -- not diagonal!):"
    @player_board.place(@player_cruiser, get_user_coordinates(@player_cruiser, @player_board))
    puts "Enter the squares for the Submarine (2 consecutive spaces -- not diagonal!):"
    @player_board.place(@player_sub, get_user_coordinates(@player_sub, @player_board))
  end
# until player_cruiser.sunk? && player_sub.sunk || cpu_cruiser.sunk? && cpu_sub.sunk?
end
