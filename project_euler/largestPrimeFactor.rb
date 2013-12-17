class LargestPrimeFactor
	def initialize(input)
		biggest_prime(input)
	end

	def biggest_prime(x)
		prime = x
		(2..Math.sqrt(x).to_i).each do |i|
			break if prime <= 1
			prime /= i while (prime > i && prime % i == 0)
		end
		puts prime
	end
end

LargestPrimeFactor.new(600851475143)