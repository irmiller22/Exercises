class PowerDigitSum
	def initialize(power)
		@power = power
	end

	def run
		sum_of_digits
	end

	def total_power(power)
		2 ** power
	end

	def sum_of_digits
		array_digits = total_power(@power).to_s.split("")
		puts array_digits.collect{ |n| n.to_i}.inject(:+)
	end
end

pds = PowerDigitSum.new(1000)
pds.run