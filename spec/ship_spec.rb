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

end
