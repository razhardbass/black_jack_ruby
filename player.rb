# frozen_string_literal: true

class Player
  attr_reader :name, :hand
  def initialize(name)
    @name = name
    @bank = Bank.new
    @hand = Hand.new
  end

  def to_s
    "#{@name} #{@hand}"
  end

  def add_card(card)
    @hand.add_card(card)
  end

  def points
    @hand.current_points
  end

  def income(money)
    @bank.income(money)
  end

  def make_bet
    @bank.make_bet
  end

  def money
    @bank.money
  end

  def cards_amount
    @hand.cards.size
  end

  def can_take_card?
    cards_amount < GameConfig::PLAYER_MAX_CARDS
  end
end
