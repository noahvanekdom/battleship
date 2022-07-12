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
        expect(cell.empty?).to eq(false)

        cell.place_ship(cruiser)

        expect(cell.ship).to eq(cruiser)
        expect(cell.empty?).to eq(false)
    end
end
