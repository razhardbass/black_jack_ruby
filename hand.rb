# frozen_string_literal: true

class Hand
  attr_reader :cards, :points

  def initialize
    @cards = []
  end

  def to_s
    appearance = ''
    @cards.each { |card| appearance += card.to_s + ' ' }
    appearance
  end

  def current_points
    @points = 0
    @cards.map { |card| @points += card.value }
    if ace_in_hand?
      ace_in_hand.each do
        @points -= GameConfig::FACE_VALUE if value > GameConfig::BJ
      end
    end
    @points
  end

  def ace_in_hand?
    @cards.any?(&:ace?)
  end

  def aces_in_hand
    amount = 0
    @cards.each { |card| amount += 1 if card.ace? }
    amount
  end

  def add_card(card)
    @cards << card
  end
end
