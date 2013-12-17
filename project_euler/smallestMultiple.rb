class SmallestMultiple
	def initialize(input)
		@lcm = 1
		find_multiple(input)
	end

	def find_multiple(input)
		(2..input).each do |i|
			@lcm *= i / gcd(@lcm, i)
			puts @lcm
		end
		puts @lcm
	end

	def gcd(a, b)
		while b > 0
			a %= b
			return b if a == 0
			b %= a
		end
		a
	end
end

SmallestMultiple.new(20)