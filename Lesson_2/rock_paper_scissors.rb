VALID_CHOICES = %w(rock paper scissors lizard spock)
abbreviated_choices = %w(ro pa sc li sp)

winning_combination = { "rock" => ["lizard", "scissors"],
                        "paper" => ["rock", "spock"],
                        "scissors" => ["paper", "lizard"],
                        "lizard" => ["spock", "paper"],
                        "spock" => ["rock", "scissors"] }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second, combo)
  combo[first].include?(second)
end

def display_results(player, computer, combo)
  if win?(player, computer, combo)
    prompt("You Won!")
  elsif win?(computer, player, combo)
    prompt("Computer Won!")
  else
    prompt("It's a tie")
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase
    if abbreviated_choices.include?(choice)
      choice = VALID_CHOICES.select { |move| move.match(choice) }[0]
    end
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; Computer chose: #{computer_choice}"

  display_results(choice, computer_choice, winning_combination)

  if win?(choice, computer_choice, winning_combination)
    player_score += 1
  end

  if win?(computer_choice, choice, winning_combination)
    computer_score += 1
  end

  if computer_score == 5
    puts "The computer wins! #{computer_score} - #{player_score}"
    break
  end

  if player_score == 5
    puts "You win! #{player_score} - #{computer_score}"
    break
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing. Good Bye!")
