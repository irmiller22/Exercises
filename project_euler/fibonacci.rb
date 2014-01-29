class Fibonacci
	
	attr_reader :fibonacci
	def initialize(n)
		@array_position = n
		@fibonacci = []
		fibonacci_sequence
	end

	def fibonacci_sequence
		(0..@array_position).each do |n|
			if n <= 1
				@fibonacci << n
			elsif n > 1
				num = @fibonacci[n-1] + @fibonacci[n-2]
				@fibonacci << num
			end
		end
		@fibonacci
	end
end

a = Fibonacci.new(25)
p a.fibonacci