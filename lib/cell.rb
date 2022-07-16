require './lib/ship'

class Cell
    attr_reader :coordinate, :fired_upon
    attr_accessor :ship

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

    def render(player_status = false)
        if @fired_upon && @ship != nil && ship.sunk?
            "X"
        elsif @fired_upon && @ship != nil
            "H"
        elsif @fired_upon
            "M"
        elsif player_status == true && @ship != nil
            "S"
        else
            "."
        end
    end
end
