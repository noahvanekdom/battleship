require './lib/board'

describe Board do
  it 'is an instance of board' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'creates a hash' do
    board = Board.new

    expect(board.cells).to be_a(Hash)
  end

  it 'creates a hash with 16 key value pairs' do
    board = Board.new

    expect(board.cells.keys.count).to eq(16)
  end

  it 'creates a hash whose keys point to cell object values' do
    board = Board.new
    
    expect(board.cells["A1"]).to be_instance_of(Cell)
  end
end
