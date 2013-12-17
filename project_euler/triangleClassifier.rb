class TriangleClassifier
	attr_reader :len1, :len2, :len3
	def initialize(len1, len2, len3)
		@len1 = len1
		@len2 = len2
		@len3 = len3
	end

	def classify(len1, len2, len3)
		if len1 == len2 && len2 == len3
			puts "equilateral"
			return :equilateral
		elsif len1 == len2 || len2 == len3 || len1 == len3
			puts "isoceles"
			return :isoceles
		elsif (len1 != len2 && len2 != len3 && len1 != len3)
			puts "scalene"
			return :scalene
		else
			raise ArgumentError
			# revise classify method so ArgumentError condition will work
		end
	end

	def call
		classify(@len1, @len2, @len3)
	end
end

triangle = TriangleClassifier.new(-1, 9, 10)
triangle.call

