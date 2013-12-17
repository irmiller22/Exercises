require 'pry'

class PrimeSummation
	def initialize(number)
		@number = number
	end

	def run
		primes_array_sum(@number)
	end

	def prime?(number)
		(2..Math.sqrt(number)).each {|i| next if i % 2 == 0; return false if number % i == 0 }
		true
	end

	def primes(upto)
		array_primes = []
		(2..upto).each {|i| array_primes << i if prime?(i)}
		array_primes
	end

	def primes_array_sum(number)
		prime_summation = primes(number).inject(:+)
		puts prime_summation
	end
end

ps = PrimeSummation.new(1999999)
ps.run

binding.pry