# frozen_string_literal: true

class GameBank
  attr_reader :money

  def initialize
    @money = 0
  end

  def bet(*players)
    players.each(&:make_bet)
    @money += GameConfig::BET_SIZE * players.size
  end

  def draw(*players)
    draw_income = @money / players.size
    players.each { |player| player.income(draw_income) }
  end

  def win(winner)
    winner.income(@money)
  end
end
