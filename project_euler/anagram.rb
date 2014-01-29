#anagram finder
require 'pry'
require 'test/unit'

class Anagram
	attr_reader :list, :hash
	

	def initialize(list)
		@list = list
		@hash = {}
		load_anagram_list(list)
	end

	def split_and_sort(string)
		string.split("").sort.join
	end

	def anagram_lookup(string)
		key = split_and_sort(string)
		@hash[key]
	end

	def load_anagram_list(list)
		list.each do |string|
			key = split_and_sort(string)
			if @hash[key].nil?
				@hash[key] = [string]
			else
				@hash[key] << string
			end
		end
		@hash
	end
end

# a = Anagram.new(["post", "pots", "stop", "stops", "tops", "top"])

# binding.pry

class AnagramTest < Test::Unit::TestCase
	def setup
		@anagram = Anagram.new(["post", "pots", "stop", "stops", "tops", "top"])
	end

	def test_list
		assert_equal ["post", "pots", "stop", "tops"], @anagram.hash.first[1]
		assert_equal 3, @anagram.hash.keys.count
	end
end