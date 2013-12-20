class MadLibs
	def initialize
		self.call
	end

	def story_prompt
		puts "Please enter an adjective, body part, and a noun."
		adjective = gets.chomp
		body_part = gets.chomp
		noun = gets.chomp
		puts "I had an #{adjective} sandwich for lunch today.  It dripped all over my #{body_part} and #{noun}."
	end

	def call
		story_prompt
	end
end

MadLibs.new