require 'pry'

a = [1,2,3,4]
b = []
c = []

def move(num, from, via, to)
		watch_hanoi(from, via, to)
		sleep(2)
	if num == 1
		to.unshift(from.shift)
	else
		via.unshift(from.shift)
		move(num - 1, from, via, to)
		to.unshift(via.shift)
	end
	watch_hanoi(from, via, to)
	sleep(1)
	to
	binding.pry
end

def watch_hanoi(from, via, to)
	system('clear')
	puts from.inspect
	puts via.inspect
	puts to.inspect
end

move(4, a, b, c)
