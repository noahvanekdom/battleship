require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  # def cells
    # cells.map do |cell|
    #   @cells << @cells[coordinate] = Cell.new(coordinate)
    # end #For each key value pair that needs to be shoveled into the hash, the key is the cell.coordinate and the value is the new cell object Cell.new(coordinate)
  # end
end
