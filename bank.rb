# frozen_string_literal: true

class Bank
  attr_reader :money

  def initialize
    @money = GameConfig::START_MONEY
  end

  def make_bet
    @money -= GameConfig::BET_SIZE
  end

  def income(money)
    @money += money
  end
end
