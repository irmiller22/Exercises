class SumSquareDifference
	attr_reader :chain

	def initialize(chain)
		@chain = chain
		difference(@chain)
	end

	def sum_squares(chain)
		sum = 0
		(1..chain).each do |i|
			sum += (i**2)
		end
		sum
	end

	def square_sum(chain)
		sum = 0
		(1..chain).each do |i|
			sum += i
		end
		sum**2
	end

	def difference(chain)
		p square_sum(chain) - sum_squares(chain)
	end
end

SumSquareDifference.new(100)