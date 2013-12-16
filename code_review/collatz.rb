class Collatz

	def initialize(input)
		@chain_array = []
		if (input < 1000000)
			return @chain_array if input == 1
			number_logic(input)
		else
			return nil
		end
	end

	def length
		@chain_array.length
	end

	def number_logic(n)
		while n != 1
			if n % 2 == 0
				n = n / 2
				@chain_array << n
			elsif n % 2 != 0
				n = (3*n) + 1
				@chain_array << n
			end
		end
		@chain_array << 1
	end
end

1000.times do |input|
	previous = 0
	if Collatz.new(input + 1).length > previous
		previous = Collatz.new(input + 1).length
	end
	puts previous
end



