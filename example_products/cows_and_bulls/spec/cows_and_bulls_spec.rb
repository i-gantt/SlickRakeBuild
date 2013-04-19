require 'rspec'
require_relative '../lib/cows_and_bulls'

describe 'CowsAndBulls' do
  it 'should create a game' do
    game = CowsAndBulls.new()
    game.should_not nil
  end
end
