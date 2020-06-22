# frozen_string_literal: true

class Bank
  attr_reader :money

  def initialize
    @money = 100
  end

  def make_bet
    @money -= 10
  end

  def income(money)
    @money += money
  end
end
