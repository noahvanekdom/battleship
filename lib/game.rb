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

    until player_cruiser.sunk? && player_sub.sunk || cpu_cruiser.sunk? && cpu_sub.sunk? do
      begin_turn
      player_last_shot = player_shot
      cpu_last_shot = cpu_shot
      shot_feedback(player_last_shot, false)
      shot_feedback(cpu_last_shot, true)
    end
      end_game
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
    puts "I have laid out my ships on the grid.\n" + "You now need to lay out your two ships.\n" +
    "The Cruiser is three units long and the Submarine is two units long."
    puts "Your board:\n" + @player_board.render
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
    puts "Your board:\n" + @player_board.render(true)
    puts "Enter the squares for the Submarine (2 consecutive spaces -- not diagonal!):"
    @player_board.place(@player_sub, get_user_coordinates(@player_sub, @player_board))
  end

  def begin_turn
    puts "=============COMPUTER BOARD=============\n" +
    @cpu_board.render
    puts "==============YOUR BOARD==============\n" +
    @player_board.render(true)
  end

  def get_player_shot(board = @cpu_board)
    player_shot_coordinate = ""
    until board.valid_coordinate?(player_shot_coordinate) do
      player_shot_coordinate = gets.chomp.to_s.upcase
      unless board.valid_coordinate?(player_shot_coordinate)
        puts "Please enter valid coordinate:"
      end
    end
    player_shot_coordinate
  end

  def player_shot
    puts "Enter the coordinate of your shot:"
    coordinate = @cpu_board.cells[get_player_shot]
    coordinate.fire_upon
    coordinate
  end

  def shot_feedback(cell, is_computer)
    pronoun = is_computer ? "My" : "Your"
    second_pronoun = is_computer ? "I" : "You"
    third_pronoun = is_computer ? "your" : "my"
    case cell.render
    when "M"
      puts "#{pronoun} shot on #{cell.coordinate} was a miss!"
    when "H"
      puts "#{pronoun} shot on #{cell.coordinate} was a hit!"
    when "X"
      puts "#{second_pronoun} sunk #{third_pronoun} #{cell.ship.name}!"
    end
  end



  def get_cpu_shot(board = @player_board)
    not_fired_upon = board.cells.select { |coordinate, cell| !cell.fired_upon? }
    not_fired_upon.keys.sample
  end


  def cpu_shot
    coordinate = @player_board.cells[get_cpu_shot]
    coordinate.fire_upon
    coordinate
  end

  def end_game
    if player_cruiser.sunk? && player_sub.sunk
      puts "I won!!! Too bad for you... :("
    else
      puts "**********You beat me! Hooray!**********"
    end
    main_menu
  end


end
