class Computer
    attr_reader :computer_cruiser_placement
    attr_reader :computer_sub_placement

    def initialize
        @computer_sub_placement = [
          ["A1", "A2"],["A2", "A3"], ["A3", "A4"],
          ["B1", "B2"],["B2", "B3"], ["B3", "B4"],
          ["C1", "C2"],["C2", "C3"], ["C3", "C4"],
          ["D1", "D2"],["D2", "D3"], ["D3", "D4"],
          ["A1", "B1"],["B1", "C1"], ["C1", "D1"],
          ["A2", "B2"],["B2", "C2"], ["C2", "D2"],
          ["A3", "B3"],["B3", "C3"], ["C3", "D3"],
          ["A4", "B4"],["B4", "C4"], ["C4", "D4"],
        ].sample

        @computer_cruiser_placement = [
          ["A1", "A2", "A3"],["A2", "A3", "A4"],
          ["B1", "B2", "B3"],["B2", "B3", "B4"],
          ["C1", "C2", "C3"],["C2", "C3", "C4"],
          ["D1", "D2", "D3"],["D2", "D3", "D4"],
          ["A1", "B1", "C1"],["A2", "B2", "C2"],
          ["A3", "B3", "C3"],["A4", "B4", "C4"],
          ["B1", "C1", "D1"],["B1", "C1", "D2"],
          ["B3", "C3", "D3"],["B4", "C4", "D4"],
        ].sample
    end


# METHOD 1
#   loop do computer_board.cells.keys.sample(3)
#     if computer_board.valid_placement?(@comp_cruiser, computer_board.cells.keys.sample(3))
#       placement_cells = computer_board.cells.keys.sample(3)
#       computer_board.place(@comp_cruiser, placement_cells)
#       break
#     end
#   end
# end

# METHOD 3
def computer_placement_coordinates(ship, board)
  computer_placement_coordinates_array = []
  until computer_placement_coordinates_array != []
    working_coordinates = @computer_board.cells.keys.sample(ship.length)
    if board.valid_placement?(ship, working_coordinates)
      computer_placement_coordinates_array = working_coordinates
    end
  end
  return computer_placement_coordinates_array
end

# METHOD 2
  # until computer_board.valid_placement?(comp_cruiser, @valids)
  #   @valids = computer_board.cells.keys.sample(3)
  # end
  #

  # comp_coordinates = computer_board.cells.keys.sample(3)

  # until ship.valid_placement?(comp_cruiser, comp_coordinates)
  #   comp_coordinates << placement_options.sample(3)
  # end
end
