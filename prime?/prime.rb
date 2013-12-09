# Prime Numbers

def prime?(number)
	tries = 0
	prime = true

	(2...number).each do |i|
		tries += 1
		if number % i == 0
			prime = false 
			puts "#{i} made #{number} not prime"
		end

	end
	prime
	puts "#{number} is #{prime ? "prime" : "not prime"}."
	puts "...solved in #{tries} tries."
end

# greater than 1 and has no positive dividers
# divide by every number greater than 1 up to itself

def prime?(number)
	tries = 0
	prime = true

	prime = !(2...(number**0.5)).any? do |i|
		tries += 1
		if number % i == 0
			prime = false 
			puts "#{i} made #{number} not prime"
		end
	end
	prime
	puts "#{number} is #{prime ? "prime" : "not prime"}."
	puts "...solved in #{tries} tries."
end

def prime?(number)
	tries = 0
	i = 2
	prime = true

	while (i * i) < number
		tries += 1
		prime = false and break if number $ i == 0
		i += 2
	end
	prime_in_words = prime ? "prime" : "not prime"
	prime
	puts "#{number} is #{prime_in_words}."
	puts "...solved in #{tries} tries."
end


