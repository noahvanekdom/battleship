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
        if @ship != nil
      @ship.hit
        else
        end
    end


    def fired_upon?
      @fired_upon
    end

    def render
        if @fired_upon && @ship != nil && ship.sunk?
            "X"
        elsif @fired_upon && @ship != nil
            "H"
        elsif @fired_upon
            "M"
        else
            "."
        end
    end
end

