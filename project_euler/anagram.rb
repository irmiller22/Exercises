require 'pry'

class Anagram
	DICTIONARY = {}	
	
	def initialize(list)
		load_dictionary(list)
	end

	def find_anagram(word)
		dictionary_key = split_sort_string(word)
		DICTIONARY[dictionary_key]
	end

	def split_sort_string(string)
		string.split("").sort.join
	end

	def load_dictionary(list)
		list.each do |word|
			dictionary_key = split_sort_string(word)
			if DICTIONARY[dictionary_key].nil?
				DICTIONARY[dictionary_key] = [word]
			else 
				DICTIONARY[dictionary_key] << word
			end
		end
	end
end

a = Anagram.new(["post", "pots", "stop", "stops", "tops", "top"])
binding.pry