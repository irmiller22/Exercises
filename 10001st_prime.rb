class Prime
	attr_accessor :input

	def initialize(input)
		@input = input
		prime_counter(@input)
	end

	def is_prime?
		count = 0
		(2..Math.sqrt(@input).floor).each do |n|
			return false if self % n == 0
			true
		end
	end

	def prime_counter(input)
		increment = 3
		count = 0
		while count <= input
			count += 1 if increment.is_prime?
			i += 2
		end
		puts "#{i} is the #{input}st Prime."
	end
end

Prime.new(6)