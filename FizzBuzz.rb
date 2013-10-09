# assignment.rb
 
# FizzBuzz - The Programmer's Stairway to Heaven
# Define the fizzbuzz method to do the following: 10pts
  # Use the modulo % method (divisible by)
    # 2 % 2 #=> true
    # 1 % 2 #=> false
  # If a number is divisible by 3, puts "Fizz".
  # If a number is divisible by 5, puts "Buzz".
  # If a number is divisible by 3 and 5, puts "FizzBuzz"
    # Use if statements 2pts
    # Use the && operator 3pts
 

def fizzbuzz(number)
	if (number % 3).zero? && (number % 5).zero?
		"FizzBuzz"
	elsif (number % 3).zero?
		"Fizz"
	else (number % 5).zero?
		"Buzz"
end

# Write a loop that will group the numbers from 1 through 50
# by whether they fizz, buzz, or fizzbuzz - 10pts

def fizzyloop(start_num, end_num)
	fizz = []
	buzz = []
	fizzbuzz = []

	(start_num..end_num).each do |x|
		fizz << fizzbuzz(x) == "Fizz"
		buzz << fizzbuzz(x) == "Buzz"
		fizzbuzz << fizzbuzz(x) == "FizzBuzz"
	end

	puts "Fizz: " + fizz.to_s
	puts "Buzz: " + buzz.to_s
	puts "FizzBuzz: " + fizzbuzz.to_s
end