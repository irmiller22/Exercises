def merge_sort(array)
	return array if array.size < 2
	left = array[0, array.length/2]
	right = array[array.length/2, array.length]

	merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
	sorted_array = []
	until left.empty? || right.empty?
		sorted_array << (left[0] <= right[0] ? left.shift : right.shift)
	end
	sorted_array.concat(left).concat(right)
	p sorted_array
end

array = [8,7,3,2,5,1,4,9,6]

merge_sort(array)