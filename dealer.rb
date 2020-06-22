# frozen_string_literal: true

class Dealer
  attr_reader :name, :dealer_bank, :dealer_hand
  def initialize
    @name = 'Dealer'
    @dealer_bank = Bank.new
    @dealer_hand = Hand.new
  end

  def to_s
    "#{@name} #{'*' * @dealer_hand.cards.size}"
  end

  def add_card(card)
    @dealer_hand.add_card(card)
  end

  def points
    @dealer_hand.current_points
  end

  def income(money)
    @dealer_bank.income(money)
  end

  def make_bet
    @dealer_bank.make_bet
  end

  def money
    @dealer_bank.money
  end

  def cards_amount
    @dealer_hand.cards.size
  end

  def can_take_card?
    cards_amount < GameConfig::PLAYER_MAX_CARDS
  end
end
