class Question
  attr_reader(:answer)
  def initialize
    @num1 = Random.rand(21)
    @num2 = Random.rand(21)
    @answer = @num1 + @num2
  end
  def to_string
    "      #{@num1} + #{@num2} = ?     "
  end
  def is_correct(user_input)
    if user_input === @answer
      return true
    else
      return false
    end
  end
# this will have all the questions the answers.
end