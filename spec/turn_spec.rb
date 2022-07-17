require './lib/board.rb'
require './lib/cell.rb'
require './lib/ship.rb'
require './lib/game.rb'

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