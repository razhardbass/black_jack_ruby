# frozen_string_literal: true

class Dealer < Player
  attr_reader :name, :bank, :hand

  def initialize
    @name = 'Dealer'
    @bank = Bank.new
    @hand = Hand.new
  end

  def to_s
    "#{@name} #{'*' * @hand.cards.size}"
  end
end
