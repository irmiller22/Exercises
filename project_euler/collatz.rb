require 'pry'

# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

class Collatz
	attr_reader :array

	def initialize(num)
		@array = []
		chain(num)
	end

	def length
		@array.length
	end

	def chain(num)
		while num != 1
			if num.even?
				@array << num /= 2
			else
				@array << num = (3*num) + 1
			end
		end
		@array
	end
end

max_n, max_chain, biggest_length = 0,0,0

(2..10**6).each do |i|
	collatz = Collatz.new(i)
	chain_length = collatz.array.length 
	if chain_length > max_chain
		max_n = i
		max_chain = chain_length
	end
end

p "#{max_n} is largest n, and #{max_chain} is largest chain length"