require 'rspec'
require_relative '../lib/bowling'

describe 'Bowling' do
  it 'Should start with a score of 0' do
    Bowling.new().score.should == 0
  end
end
