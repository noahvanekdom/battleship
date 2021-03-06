require './lib/board'

describe Board do
  let(:board) { Board.new }
  let(:cruiser) {Ship.new("Cruiser", 3)}
  let(:submarine) {Ship.new("Submarine", 2)}
  let(:cell_1) {board.cells["A1"]}
  let(:cell_2) {board.cells["A2"]}
  let(:cell_3) {board.cells["A3"]}

  describe 'Board.new' do
  it 'is an instance of board' do
    # board = Board.new
    expect(board).to be_instance_of(Board)
  end

  it 'creates a hash' do
    # board = Board.new
    expect(board.cells).to be_a(Hash)
  end

  it 'creates a hash with 16 key value pairs' do
    # board = Board.new
    expect(board.cells.keys.count).to eq(16)
  end

  it 'creates a hash whose keys point to cell object values' do
    # board = Board.new
    expect(board.cells["A1"]).to be_instance_of(Cell)
    end
  end

  describe 'valid_coordinate?' do
    # board = Board.new
    context 'when the coordinate is valid' do
      it 'returns true' do
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
      end
    end

    context 'when the coordinate is invalid' do
      it 'returns false' do
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
        end
      end
    end

  describe 'valid_ship_placement?' do
    context 'when the placement is the wrong length' do
      it 'returns false' do
    expect(board.valid_placement?(cruiser, ["A1","A2"])).to be false
    expect(board.valid_placement?(submarine, ["A1","A2","A3"])).to be false
      end
    end

    context 'when the placement is not connected' do
      it 'returns false' do
    expect(board.valid_placement?(cruiser, ["A1","A2","A4"])).to be false
    expect(board.valid_placement?(submarine, ["A1","C1"])).to be false
      end
    end

    context 'when the placement is backwards' do
      it 'returns false' do
    expect(board.valid_placement?(cruiser, ["A3","A2","A1"])).to be false
    expect(board.valid_placement?(submarine, ["C1","B1"])).to be false
      end
    end

    context 'when the placement is diagonal' do
      it 'returns false' do
    expect(board.valid_placement?(cruiser, ["A1","B2","C3"])).to be false
    expect(board.valid_placement?(submarine, ["C2","D3"])).to be false
      end
    end

    context 'when the cell is occupied' do
      it 'returns false' do
        board.place(cruiser, ["A1", "A2", "A3"])

        expect(board.valid_placement?(submarine, ["A1", "B1"])).to be false
      end
    end

    context 'when the placement is valid' do
        it 'returns true' do
    expect(board.valid_placement?(submarine, ["A1","A2"])).to be true
    expect(board.valid_placement?(cruiser, ["B1","C1","D1"])).to be true
      end
    end
  end

  describe 'place ship method' do
    context 'when a ship is placed' do
      it 'can return ship object that occupies the cell' do

      board.place(cruiser, ["A1", "A2", "A3"])

        expect(cell_1.ship).to eq(cruiser)
        expect(cell_2.ship).to eq(cruiser)
        expect(cell_3.ship).to eq(cruiser)
        expect(cell_3.ship == cell_2.ship).to be true
      end
    end
  end

  describe 'render method' do
    context 'when called' do
      it 'returns a formatted string displaying the board' do
        board.place(cruiser, ["A1","A2","A3"])
        expect(board.render).to eq ("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      end
    end


    context 'when initially displaying the players board' do
      it 'it returns S for the position of the ships' do
        board.place(cruiser, ["A1","A2","A3"])
        expect(board.render(true)).to eq ("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
      end
    end
  end
end

