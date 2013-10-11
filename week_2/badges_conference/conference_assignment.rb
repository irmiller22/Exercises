def print_message(names)
	empty_array = []
	names.each do |name|
		empty_array << "Hello, my name is #{name}"
	end
	empty_array
end

def schedule(names)
	room_number = 1
	schedules = []
	names.each do |name|
		schedules << "Hey #{name}, you're in #{room_number}."
		room_number += 1
	end
	schedules
end


names = %w[Edsger Ada Charles Alan Grace Linus Matz]

badges = print_message(names)
schedules = schedule(names)
puts schedules
