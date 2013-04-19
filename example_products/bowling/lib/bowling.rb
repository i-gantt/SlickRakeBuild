class Bowling
  attr_accessor :score
  def initialize
    @score = 0
  end

  def hit(pins)
    @score += pins
  end
end
