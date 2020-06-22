# frozen_string_literal: true

require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'bank.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'
require_relative 'game_config.rb'
require_relative 'card.rb'
require_relative 'interface.rb'
require_relative 'game_bank.rb'

class BlackJack
  include Interface

  def initialize
    @dealer = Dealer.new
    @player = create_player
    @game_bank = GameBank.new
  end

  def start_programm
    loop do
      new_game
      show_new_game_text
      @game_bank.bet(@player, @dealer)
      show_table
      play_game
      game_result
      new_game?
      clear_table
    end
  end

  def create_player
    name = show_hello
    Player.new(name)
  end

  def new_game
    @deck = Deck.new
    GameConfig::START_CARDS.times { @player.add_card(@deck.give_a_card) }
    GameConfig::START_CARDS.times { @dealer.add_card(@deck.give_a_card) }
  end

  def play_game
    loop do
      break unless players_can_make_bets?

      show_action_request
      response_action
      break if !@player.can_take_card? && !@dealer.can_take_card?
      break if @enter == 3
    end
  end

  def response_action
    @enter = gets.to_i
    if @enter == 1 then skip_a_move
    elsif @enter == 2 then add_a_card
    elsif @enter == 3 then show_open_table
    end
  end

  def skip_a_move
    puts 'Ход дилера...'
    sleep 1
    loop do
      break unless @dealer.can_take_card?
      break if @dealer.points >= GameConfig::DEALER_MAX_POINTS

      @dealer.add_card(@deck.give_a_card)
    end
  end

  def add_a_card
    return unless @player.can_take_card?

    @player.add_card(@deck.give_a_card)
    show_table
  end

  def game_result
    winner = determine_winner
    if winner.nil?
      @game_bank.draw(@player, @dealer)
      show_drow
      show_open_table
    else
      @game_bank.win(winner)
      show_winner(winner)
      show_open_table
    end
  end

  def determine_winner
    if (@player.points > GameConfig::BJ) && (@dealer.points > GameConfig::BJ)
      return
    end
    return if @player.points == @dealer.points
    return @dealer if @player.points > GameConfig::BJ
    return @player if @dealer.points > GameConfig::BJ

    if @player.points > @dealer.points
      @player
    else
      @dealer
    end
  end

  def clear_table
    @deck = Deck.new
    @player.player_hand.cards.clear
    @dealer.dealer_hand.cards.clear
  end

  def players_can_make_bets?
    @player.money >= GameConfig::BET_SIZE && @dealer.money >= GameConfig::BET_SIZE
  end
end

BlackJack.new.start_programm
