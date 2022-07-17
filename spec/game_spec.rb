require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require './lib/game.rb'

describe Game do
  describe 'game setup' do
    game = Game.new

    it 'is an instance of game' do
      expect(game).to be_instance_of(Game)
    end

    it 'has a player and computer board' do
      expect(game.player_board).to be_instance_of(Board)
      expect(game.cpu_board).to be_instance_of(Board)
    end

    it 'has ships for both player and computer' do
      expect(game.player_cruiser).to be_instance_of(Ship)
      expect(game.player_sub).to be_instance_of(Ship)
      expect(game.cpu_cruiser).to be_instance_of(Ship)
      expect(game.cpu_sub).to be_instance_of(Ship)
    end

    xit 'has the computer place ships on computer board' do
    end

    xit 'allows the user to enter valid sequences to place both ships' do
    end

    xit 'handles invalid inputs' do
    end
  end



  describe 'end game ' do
    xit 'ends the game when all users ships have sunk' do
    end

    xit 'ends the game when all users ships have sunk' do
    end

    xit 'reports who won' do
    end

    xit 'returns to the main menu when then game is over' do
    end
  end

end
