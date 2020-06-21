class Hand 
  attr_reader :cards, :points

  def initialize(card1, value1, card2, value2)
    @cards = []
    @points = []
    @cards << card1
    @points << value1.to_i
    @cards << card2
    @points << value2.to_i
  end

  def current_points
    @points.sum
  end

  def ace_in_hand
   if @points.include?(11)
    current_points -= 10
   end
  end

  def add_card(card,value_card)
    @cards << card
    @points << value_card.to_i
  end
end
