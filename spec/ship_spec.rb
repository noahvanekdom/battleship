require './lib/ship'

describe Ship do
  it 'is an instance of ship' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'can be sunk' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(cruiser.sunk?).to eq(false)

    cruiser.hit

    expect(cruiser.health).to eq(2)

    cruiser.hit

    expect(cruiser.health).to eq(1)

    cruiser.hit

    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to eq(true)


    expect(submarine.sunk?).to eq(false)
    submarine.hit
    expect(submarine.health).to eq(1)
    submarine.hit
    expect(submarine.sunk?).to eq(true)
  end
  
end
