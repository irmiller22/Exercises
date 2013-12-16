# permutations for 0-9
require 'pry'

class Permutation
	attr_accessor :number, :targeted_perm_array, :targeted_perm_number

	def initialize(number)
		self.number = (number - 1)
		solver
	end

	def solver
		@permutation_array = (0..9).to_a
		@targeted_perm_array = @permutation_array.permutation.to_a[self.number]
		@targeted_perm_number = @targeted_perm_array.join("").to_i
	end
end

target = Permutation.new(1000000)
binding.pry