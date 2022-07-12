require './lib/ship'

class Cell
    attr_reader :coordinate, :ship, :fired_upon

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def place_ship(ship_type)
        @ship = ship_type
    end

    def empty?
       @ship == nil
    end

    def fire_upon
      @fired_upon = true
      ship_type.health -= 1
    end

    def fired_upon?
      @fired_upon
    end

end
