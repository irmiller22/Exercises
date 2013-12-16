require 'pry'

class PrimeSummation
	def initialize(number)
		@number = number
	end

	def run
		primes_array_sum(@number)
	end

	def prime?(number)
		(2..number).each {|i| return false if number % i == 0}
		true
	end

	def primes(upto)
		array_primes = []
		(2..upto).each {|i| array_primes << i if prime?(i)}
		array_primes
	end

	def primes_array_sum(number)
		puts primes(number)
	end
end

ps = PrimeSummation.new(200)
ps.run

binding.pry