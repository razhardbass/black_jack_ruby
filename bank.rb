class Bank
  attr_reader :money

  def initialize
    @money = 100
  end

  def make_bet 
    @money -= 10
  end

  def draw
    @money += 10
  end

  def win_game
    @money += 20 
  end

  def to_s
    @money
  end
end
