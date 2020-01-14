# ------------------------------------------------------------- #
# A Mortgage Calculator #
# ------------------------------------------------------------- #

# Three pieces of information required
# The Loan Amount
# The Annual Percentage Rate (APR)
# The Loan Duration

# Calculate two things from the information above
# Monthly Interest Rate
# Loan Duration in Months

# formula m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# ------------------------------------------------------------- #
# Pseudo Code
# ------------------------------------------------------------- #

# GET Loan amount from user
# SET Loan amount
# SET Annual Percentage Rate
# GET Loan duration from user
# SET Loan duration
# Process information using formula
# SET Monthly payment = formula output
# PRINT Monthly payment

# ------------------------------------------------------------- #
# Ruby Code
# ------------------------------------------------------------- #

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  Integer(num) rescue false
end

def float?(num)
  Float(num) rescue false
end

prompt("Welcome to the Mortgage Calculator!")

loop do
  prompt("How much are you looking to borrow?")

  loan_amount = nil
  loop do
    loan_amount = gets.chomp.to_i
    if valid_number?(loan_amount)
      break
    else
      prompt("Please enter a number")
    end
  end

  prompt("How many years were you looking to borrow for?")

  loan_duration_years = nil
  loop do
    loan_duration_years = gets.chomp.to_i
    if valid_number?(loan_duration_years)
      break
    else
      prompt("That isn't a valid number")
    end
  end

  loan_duration_months = loan_duration_years * 12

  prompt("What is the Annual Percentage Rate? (APR)")

  apr = nil
  loop do
    apr = gets.chomp.to_i / 100.0
    if valid_number?(apr)
      break
    else
      prompt("Please enter a number")
    end
  end

  monthly_percentage_rate = apr / 12

  monthly_payment =
    loan_amount * (monthly_percentage_rate /
      (1 - (1 + monthly_percentage_rate)**(-loan_duration_months)))

  prompt("Your monthly repayment is #{monthly_payment.truncate(2)}")

  prompt("Would you like to calculator a new mortgage? (Y to calculate again)")
  reset = gets.chomp
  break unless reset.downcase.start_with?("y")
end

prompt("Thanks for using the mortgage calculator!")
