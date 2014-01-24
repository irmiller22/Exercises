class FactorialDigitSum
	attr_reader :sum
	
	def initialize
		@sum = 0
		sum(100)
	end

	def factorial(n)
		if n == 1
			return 1
		else
			return n * factorial(n-1)
		end
	end

	def sum(n)
		factorial(100).to_s.split("").each do |i|
			@sum += i.to_i
		end
		p @sum
	end
end

FactorialDigitSum.new