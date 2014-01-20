require 'pry'
# The cube, 4106325 (345^3) can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3).  In fact, 4106325 is the smallest cube which has exactly three permutations of its digits which are also cube.

# Find the smallest cube for which exactly five permutations of its digits are cube.

class CubicPermutation
	attr_reader :array

	def initialize(num)
		@array = {}
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
				puts "First element of 5 cubed array - #{v.first.to_i}, followed by cube root of first element - #{Math.cbrt(v.first.to_i)}"
				break
			end
		end
	end
end

c = CubicPermutation.new(5)


