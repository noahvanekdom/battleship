require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  # # idea for Iteration 4 - board of any size
  # def cells
  # # For each key value pair that needs to be shoveled into the hash, the key is the cell.coordinate and the value is the new cell object Cell.new(coordinate)
  #   cells.map do |cell|
  #     @cells << @cells[coordinate] = Cell.new(coordinate)
  #   end
  # end

  def valid_coordinate?(coordinate)
    (coordinate.start_with?("A") || coordinate.start_with?("B") || coordinate.start_with?("C") || coordinate.start_with?("D")) &&
    coordinate[1..-1].to_i.between?(1,4)
  end


    coordinates.each do |coordinate|
      if @cells[coordinate].empty?
      else
        return false
      end
    end

    x_coords = []
    y_coords = []

      coordinates.map do |coordinate|
        x_coords << coordinate[0].ord
        y_coords << coordinate[1].to_i
      end


      if x_coords.uniq.count == 1
          y_coords == (y_coords.min..y_coords.max).to_a && y_coords.count == ship.length
      elsif y_coords.uniq.count == 1
          x_coords == (x_coords.min..x_coords.max).to_a && x_coords.count == ship.length
      else
        return false
      end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end
end
