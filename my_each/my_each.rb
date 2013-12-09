class Array

	def my_each
		if block_given?
			i = 0
			while i < self.size
				yield(self[i])
				i += 1
			end
		end
	end
end

[2, 10, 12, 15].my_each 
[2, 10, 12].my_each {puts "ian"}
[2, 10, 12].my_each  {|e| puts e*e}


