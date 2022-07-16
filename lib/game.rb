class Game
  attr_reader :player_board, :computer_board, :player_cruiser, :player_sub, :comp_cruiser, :comp_sub

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @comp_cruiser = Ship.new("Cruiser", 3)
    @comp_sub = Ship.new("Submarine", 2)
  end
end
