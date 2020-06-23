# frozen_string_literal: true

module Interface
  SPACE = '---' * 20
  def show_hello
    puts 'Приветсвуем в игре Black Jack! Как вас зовут?'
    gets.to_s
  end

  def show_new_game_text
    puts 'Ставки сделаны! Игра началась!'
  end

  def show_table
    puts SPACE
    puts @dealer.to_s
    puts "Банк дилера: #{@dealer.money}"
    puts SPACE
    puts "Ваши карты, #{@player}"
    puts "Ваши очки: #{@player.points}"
    puts "Ваш банк: #{@player.money}"
    puts SPACE
  end

  def show_open_table
    puts SPACE
    puts @dealer
    puts "Карты дилера: #{@dealer.hand}"
    puts "Очки дилера: #{@dealer.points}"
    puts "Банк дилера: #{@dealer.money}"
    puts SPACE
    puts "Ваши карты, #{@player}"
    puts "Ваши очки: #{@player.points}"
    puts "Ваш банк: #{@player.money}"
    puts SPACE
  end

  def show_action_request
    puts 'Введите 1, чтобы пропустить ход'
    puts 'Введите 2, чтобы взять карту'
    puts 'Введите 3, что бы открыть карты'
    puts 'Введите цифру от 1 до 3'
    puts SPACE
  end

  def show_drow
    puts 'Ничья!'
  end

  def show_winner(name)
    puts "Выйграл #{name}! Поздравляем!"
  end

  def new_game?
    puts 'Нажмите 1 , чтобы сыграть еще раз'
    new_game = gets.to_i
    new_game == 1
  end
end
