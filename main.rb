require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'bank.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'

class BlackJack

  COMPLITION = '--' * 60
  def initialize
  end

  def start_programm
    hello
    new_game
    @dealer_bank.make_bet
    @user_bank.make_bet
    table
    play_game
    game_result
  end

  def hello
    puts "Приветсвуем в игре Black Jack! Как вас зовут?"
    name = gets.chomp.to_s
    @player_name = Player.new(name)
    @dealer = Dealer.new
    puts "Ставки сделаны, игра начинается!"
  end
  
  def new_game
    @new_deck = Deck.new
    @dealer_bank = Bank.new
    @user_bank = Bank.new
    @user_hand = Hand.new(@new_deck.give_a_card, @new_deck.value, @new_deck.give_a_card, @new_deck.value)
  end

  def table
    puts COMPLITION
    puts "Дилер"
    puts "Карты дилера :['**', '**']  очки:"
    puts "Банк дилера  :#{@dealer_bank.money}"
    puts "==================================================="   
    puts "#{@player_name.name}"
    puts "Ваши карты : #{@user_hand.cards} очки: #{@user_hand.current_points} "
    puts "Ваш банк   : #{@user_bank.money}"
    puts COMPLITION
  end

  def play_game
    loop do
      action_request
      response_action
      break if @action == 3
    end
  end

  def action_request
    puts "Ваши действия: "
    puts 'Нажмите 1, что бы пропустить ход'
    puts 'Нажмите 2, что бы взять карту'
    puts 'Нажмите 3, что бы открыть карты'
  end

  def response_action
    case gets.to_i
      when 1 
        skip_a_move
      when 2
        add_card
      when 3
        open_cards
      else
       puts 'Введите число от 1 до 3'
    end
  end

  def game_result
    skip_a_move
    if (@user_hand.current_points > 21) && (@dealer_hand.current_points > 21)
      @user_bank.draw
      @dealer_bank.draw
    end
    if @user_hand.current_points == @dealer_hand.current_points
      @user_bank.draw
      @dealer_bank.draw
    end
    if @user_hand.current_points > 21
      @dealer_bank.win_game
    end
    if  @dealer_hand.current_points > 21
      @user_bank.win_game
    end
    if @user_hand.current_points > @dealer_hand.current_points
      @user_bank.win_game
    else
      @dealer_bank.win_game
    end
  end

  def skip_a_move
    @dealer_hand = Hand.new(@new_deck.give_a_card, @new_deck.value, @new_deck.give_a_card, @new_deck.value)
    dealer_points = @dealer_hand.current_points
    loop do
      @dealer_hand.add_card(@new_deck.give_a_card,@new_deck.value)
      break if dealer_points < 17
    end
  end

  def add_card
    @user_hand.add_card(@new_deck.give_a_card, @new_deck.value)
    table
  end

  def open_cards
    skip_a_move
    puts COMPLITION
    puts "Карты дилера :#{@dealer_hand.cards} очки: #{@dealer_hand.current_points}"
    puts "Банк дилера  :#{@dealer_bank.money}"
    puts "==================================================="           
    puts "Ваши карты : #{@user_hand.cards} очки: #{@user_hand.current_points} "
    puts "Ваш банк   : #{@user_bank.money}"
    puts COMPLITION
    return
  end
end



BlackJack.new.start_programm
