require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require './lib/game.rb'

describe Game do
  let(:game) {Game.new}
  describe 'game setup' do

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

    it 'has the computer place ships on computer board' do
      allow(game).to receive(:cpu_placement_coordinates).and_return(["A1","A2","A3"],["C2","C3"])
      game.place_cpu_ships


      expect(game.cpu_board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . S S . \nD . . . . \n")
    end

    it 'allows the user to enter valid sequences to place both ships' do
      allow(game).to receive(:get_user_coordinates).and_return(["A1","A2","A3"],["C2","C3"])
      game.place_user_ships


      expect(game.player_board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . S S . \nD . . . . \n")
    end
  end

  describe 'turns' do
    xit 'displays both boards' do
    #begin_turn method, user board is displayed showing hits, misses, sunken ships, and ships
    #Computer board is displayed showing hits, misses, sunken ships, and ships
    #Board is updated after a turn
    end

    xit 'allows a player to choose a coordinate to fire on' do
    #player_shot method
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
    it 'ends the game when all users ships have sunk and reports winner' do
      game.player_cruiser.health =0
      game.player_sub.health = 0

      expect(game.end_game).to eq "I won!!! Too bad for you... :("
    end

    xit 'ends the game when all users ships have sunk and reports winner' do
      game.cpu_cruiser.health =0
      game.cpu_sub.health = 0

      expect(game.end_game).to eq "**********You beat me! Hooray!**********"
    end
  end

end
