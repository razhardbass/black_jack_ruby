# frozen_string_literal: true

class GameBank
  attr_reader :money

  def initialize
    @money = 0
  end

  def bet(player, dealer)
    player.make_bet
    dealer.make_bet
    @money = 20
  end

  def draw(player, dealer)
    player.income(GameConfig::BET_SIZE)
    dealer.income(GameConfig::BET_SIZE)
  end

  def win(winner)
    winner.income(@money)
  end
end
