require "pry"
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals


def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts "You're an #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, seperator=",", word="or" )
  return arr[0] if arr.length == 1
  arr_copy = arr
  arr_last = arr_copy.pop
  "#{arr.join(seperator)} #{word} #{arr_last}"
end

#--------CURRENT PLAYER----------#

def who_goes_first
  loop do
    prompt("Who goes first, Player or Computer?")
    current_player = gets.chomp
    if current_player == "Player" || current_player == "Computer"
      return current_player
    else
      prompt("Invalid choice")
    end
  end
end

def place_piece!(board, current_player)
  if current_player == "Player"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  if current_player == "Player"
    current_player = "Computer"
  else
    current_player = "Player"
  end
end

#--------PLAYER MOVES----------#

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    end
    puts "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

#--------COMPUTERS MOVES----------#

def computer_places_piece!(brd)
    defend = defensive_move(brd)
    finish = finishing_move(brd)
    first_move?(brd)
  if brd[5] == INITIAL_MARKER # Computer prioritises square 5.
    brd[5] = COMPUTER_MARKER
  elsif first_move?(brd) # Computer picks a corner for it's first turn if 5 isn't avaiable, this move along with the rest of the logic prevents the computer from ever losing.
    brd[opening_move(brd).sample] = COMPUTER_MARKER
  elsif !finish.empty? # Computer picks a winning move if possible
    brd[finish[0]] = COMPUTER_MARKER
  elsif !defend.empty? # Computer performs a blocking move if necessary.
    brd[defend.sample] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample # Computer will choose at random otherwise.
    brd[square] = COMPUTER_MARKER
  end
end

def first_move?(brd)
  !brd.values.any?(COMPUTER_MARKER)
end

def opening_move(brd)
  arr = [1,3,7,9]
  empty_space = []
  arr.each do |num|
    if brd[num] == INITIAL_MARKER
      empty_space << num
    end
  end
  empty_space
end


def finishing_move(brd)
  determine_board_state(brd, COMPUTER_MARKER)
end

def defensive_move(brd)
  determine_board_state(brd, PLAYER_MARKER)
end

def determine_board_state(brd, move)
  spaces = []
  WINNING_LINES.each do |line|
    count = 0
    line.each do |num|
      if brd[num] == move
        count += 1
      end
    end
    if count == 2
      line.each do |num|
        if brd[num] == INITIAL_MARKER
          spaces << num
        end
      end
    end
  end
  spaces
end

#--------WIN/LOSE/DRAW----------#

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return "Player"
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return "Computer"
    end
  end
  nil
end

#--------SCORE----------#

scores = { player: 0, computer: 0 }
def first_to_five(score)
  if score[:player] == 5
    "Player"
  elsif score[:computer] == 5
    "Computer"
  else
    false
  end
end

#--------GAMEPLAY LOOP----------#

loop do
  board = initialize_board
  display_board(board)
  current_player = who_goes_first

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  case detect_winner(board)
  when "Player" then scores[:player] += 1
  when "Computer" then scores[:computer] += 1
  end

  if first_to_five(scores) == "Player"
    prompt("Player wins: #{scores[:player]} : #{scores[:computer]}")
    break
  elsif first_to_five(scores) == "Computer"
    prompt("Computer wins: #{scores[:computer]} : #{scores[:player]}")
    break
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

#--------ENDING MESSAGE----------#

prompt "Thanks for playing Tic Tac Toe. Goodbye!"

