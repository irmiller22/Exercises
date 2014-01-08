require 'pry'
class Prime
	attr_accessor :target

	def initialize(target)
		@target = target
		prime_counter(@target)
	end

	def is_prime?(number)
		return false if number == 0 || number == 1
		integers =* (2..Math.sqrt(number).round)
		integers.each {|i| return false if number % i == 0}
		true 
	end

	def prime_counter(target)
		count = 0
		number = 0
		while count != target
			number += 1
			count += 1 if is_prime?(number)
		end
		puts "#{number} is the #{count}st Prime."
	end
end

hello = Prime.new(10001)
