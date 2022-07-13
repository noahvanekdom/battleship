require './lib/ship'
require './lib/cell'

describe Cell do
    it 'is an instance of cell' do
        cell = Cell.new('B4')

        expect(cell).to be_instance_of(Cell)
    end

    it 'has a coordinate' do
        cell = Cell.new('B4')

        expect(cell.coordinate).to eq('B4')
    end

    it 'can report its contents' do
        cell = Cell.new('B4')
        cruiser = Ship.new("Cruiser", 3)

        expect(cell.ship).to eq(nil)
        expect(cell.empty?).to eq(true)

        cell.place_ship(cruiser)

        expect(cell.ship).to eq(cruiser)
        expect(cell.empty?).to eq(false)
    end

    it 'responds to being fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)

      cell.place_ship(cruiser)

      expect(cell.fired_upon?).to eq(false)

      cell.fire_upon

      expect(cell.ship.health).to eq(2)
      expect(cell.fired_upon?).to eq(true)
    end
end
