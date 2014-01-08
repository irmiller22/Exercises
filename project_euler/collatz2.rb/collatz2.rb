# Collatz Sequence

# n -> n/2 (if n is even)
# n -> 3n + 1 (if n is odd)

# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

# what starting number, under 1 million, produces the longest chain?

class Collatz
	attr_accessor :results

	def initialize(number)
		@results = []
		collatz_chain(number)
	end

	def collatz_chain(number)
		raise "Zero is invalid!" if number == 0
		return 1 if number == 1

		if number.even?
			results << collatz_chain(number/2).insert(0, number)
		else
			results << collatz_chain(3*number + 1).insert(0, number)
		end
		results.flatten
	end
end

hmm = Collatz.new(598)
puts hmm