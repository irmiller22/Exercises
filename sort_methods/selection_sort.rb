def selection_sort(array)
	(1..array.length - 1).each do |element|
		value = array[element]
		j = element - 1
		while j >= 0 && array[j] > value do 
			array [j + 1] = array[j]
			j -= 1
		end
		array[j + 1] = value
	end
	array
end

array = [9,4,5,7,3,1,2]

p selection_sort(array)