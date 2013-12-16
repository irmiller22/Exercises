class NewsCLI
	attr_accessor :stories
	COMMANDS = [:list, :help, :exit]

	def initialize
		@on = true
		self.help
	end

	def on?
		@on
	end

	def help
		puts "Please select help, list, or exit."
		self.command_request
	end

	def command_input
		if COMMANDS.include?(input.strip.downcase.to_sym)
			self.send(input)
		else
			puts "Invalid Command."
		end
	end

	def call
		while self.on?
			self.help
		end
	end

	def exit
		puts "Thanks for playing!"
		@on = false
	end

	def list
		puts "Here are the following stories:"
		self.help
	end

end