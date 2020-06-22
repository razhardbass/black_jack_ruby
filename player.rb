# frozen_string_literal: true

class Player
  attr_reader :name, :player_hand
  def initialize(name)
    @name = name
    @player_bank = Bank.new
    @player_hand = Hand.new
  end

  def to_s
    "#{@name} #{@player_hand}"
  end

  def add_card(card)
    @player_hand.add_card(card)
  end

  def points
    @player_hand.current_points
  end

  def income(money)
    @player_bank.income(money)
  end

  def make_bet
    @player_bank.make_bet
  end

  def money
    @player_bank.money
  end

  def cards_amount
    @player_hand.cards.size
  end

  def can_take_card?
    cards_amount < GameConfig::PLAYER_MAX_CARDS
  end
end
