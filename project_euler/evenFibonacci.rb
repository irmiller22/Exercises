class EvenFibonacci
	def initialize
		@fibonacci_array = []
		@first = 0
		@second = 1
		fibonacci
	end

	def fibonacci
		i = 0
		while i <= 4000000
			i = @first + @second
			@fibonacci_array << i if i % 2 == 0
			@first = @second
			@second = i
		end
		puts "The sum of all even Fibs is #{@fibonacci_array.inject(:+)}"
	end
end

EvenFibonacci.new