require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require './lib/game.rb'

describe Game do
  describe 'game setup' do
    game = Game.new
    require "pry"; binding.pry
    it 'is an instance of game' do
      expect(game).to be_instance_of(Game)
    end

    it 'has a player and computer board' do
      expect(game.player_board).to be_instance_of(Board)
      expect(game.computer_board).to be_instance_of(Board)
    end

    it 'has ships for both player and computer' do
      expect(game.player_cruiser).to be_instance_of(Ship)
      expect(game.player_sub).to be_instance_of(Ship)
      expect(game.comp_cruiser).to be_instance_of(Ship)
      expect(game.comp_sub).to be_instance_of(Ship)
    end

    xit 'has the computer place ships on computer board' do
    end

    xit 'allows the user to enter valid sequences to place both ships' do
    end

    xit 'handles invalid inputs' do
    end
  end

  describe 'turn' do
    xit 'displays both boards' do
      #User board is displayed showing hits, misses, sunken ships, and ships
      #Computer board is displayed showing hits, misses, sunken ships, and ships
      #Board is updated after a turn
    end

    xit 'allows a player to choose a coordinate to fire on' do
      #Entering invalid coordinate prompts user to enter valid coordinate
      #User in informed when they have already fired on a coordinate
    end

    xit 'randomly chooses a coordinate to fire upon' do
      #Computer chooses random shot
      #Computer does not fire in the same spot twice
    end

    xit 'reports the results of both shots' do
      #Returns a text string to user based on the result of a shot
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
