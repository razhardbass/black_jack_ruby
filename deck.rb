class Deck 

  FACE = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUIT = %w[♡ ♧ ♢ ♤]
  
  attr_reader :value

  def value_card
    @value_card1 = FACE.sample
    if %w[J Q K].include?(@value_card1)
      @value = 10 
    elsif @value_card1 == 'A'
      @value = 11
    else
      @value = @value_card1
    end
    @value.to_i
  end

  def give_a_card
    value_card
    @card = "#{@value_card1}#{SUIT.sample}"
  end
end
