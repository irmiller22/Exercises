def bubble_sort(array)
	array.each_index do |x|
		(array.length - x - 1).times do |element|
			if array[element] > array[element + 1]
				array[element], array[element + 1] = array[element + 1], array[element]
			end
		end
	end
end

array = [9,5,7,3,4,2,1]

p bubble_sort(array)