require 'test/unit'
# The cube, 4106325 (345^3) can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3).  In fact, 4106325 is the smallest cube which has exactly three permutations of its digits which are also cube.

# Find the smallest cube for which exactly five permutations of its digits are cube.

class CubicPermutation
	attr_reader :array, :final

	def initialize(num)
		@array = {}
		@final = []
		cube
		permutations(num)
	end

	def cube
		(345..9999).each do |num|
			cube = num ** 3
			perm = cube.to_s.split("").sort.join
			@array[perm] ||= []
			@array[perm] << cube
		end
	end

	def permutations(num)
		@array.each do |k,v|
			if v.count >= num
				@final = @array[k]
				break
			end
		end
	end
end

class CubicPermutationTest < Test::Unit::TestCase
	def test_perm
		assert_equal [41063625, 56623104, 66430125], CubicPermutation.new(3).final
		assert_equal 41063625, CubicPermutation.new(3).final.first
		assert_equal (345 ** 3), CubicPermutation.new(3).final.first
		assert_equal 5, CubicPermutation.new(5).final.count
		assert_equal (5027 ** 3), CubicPermutation.new(5).final.first
		assert_equal 127035954683, CubicPermutation.new(5).final.first
	end
end