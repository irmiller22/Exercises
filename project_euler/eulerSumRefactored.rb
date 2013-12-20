require 'test/unit'

class EulerSum
	attr_reader :sum, :limit

	def initialize(limit)
		@limit = limit
		@sum = 0
		calculate
	end

	def calculate
		(0..limit).each do |number|
			@sum += number if number % 3 == 0 || number % 5 == 0
		end
	end
end

class EulerSumTest < Test::Unit::TestCase
	def test_sum
		assert_equal 0, EulerSum.new(1).sum
		assert_equal 3, EulerSum.new(3).sum
		assert_equal 60, EulerSum.new(15).sum
		assert_equal 234168, EulerSum.new(1000).sum
	end
end