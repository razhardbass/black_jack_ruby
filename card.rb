# frozen_string_literal: true

class Card
  include GameConfig

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = determine_value
  end

  def to_s
    "#{rank} #{suit}"
  end

  def ace?
    rank == 'A'
  end

  private

  def determine_value
    if %w[J Q K].include?(rank)
      GameConfig::FACE_VALUE
    elsif ace?
      GameConfig::ACE_VALUE
    else
      rank.to_i
    end
  end
end
