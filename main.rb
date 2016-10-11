require_relative 'player'
require_relative 'question'

@turn = 0

puts "Welcome to the Ruby Math Game"


p1 = Player.new("Player1")

p2 = Player.new("Player2")

puts "Let's begin"
@game_on = true
while @game_on
  question = Question.new

  case @turn
  when 0
    print "#{p1.name}"
  else
    print "#{p2.name}"
  end

  print question.to_string
  @user_input = gets.chomp.to_i

  if @turn == 0 && question.is_correct(@user_input)
    puts "Congrats on the right answer"
    @turn += 1
  elsif @turn == 0 && !question.is_correct(@user_input)
    puts "wrong!!!!!"
    p1.lose_life
    @turn += 1
  elsif @turn == 1 && question.is_correct(@user_input)
    puts "Congrats on the right answer"
    @turn -= 1
  elsif @turn == 1 && !question.is_correct(@user_input)
    puts "wrong!!!!!"
    p2.lose_life
    @turn -= 1
  end

  puts
  puts "PLAYER1 VITALS @@@ Player 1 has #{p1.lives} left"
  puts "PLAYER2 VITALS @@@ Player 2 has #{p2.lives} left"
  puts

  if p1.lives < 1 || p2.lives < 1
    puts "GAME IS OVER; ONE OF YOU IS A LOSER"
    if p1.lives < 1
      puts "Player two is the winner"
    elsif p2.lives < 1
      puts "Player one is the winner"
    end
    @game_on = false
  end
end
