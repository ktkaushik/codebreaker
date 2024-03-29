module Codebreaker
	class Game
		def initialize(output)
			@output = output
		end

		def start(secret=nil)
			@secret=secret
			@output.puts "Welcome to Codebreaker!"
			@output.puts "Enter Guess:"	
		end

		def guess(guess)
			exact_match_count = 0
			number_match_count = 0
			mark = ''
			(0..3).each do |index|
				if exact_match?(guess , index)
					exact_match_count += 1
				end
			end
			(0..3).each do |index|
				if number_include?(guess , index)
					number_match_count += 1
				end
			end
			@output.puts '+'*exact_match_count + '-'*number_match_count
		end

		def exact_match?(guess , index)
			guess[index] == @secret[index]
		end

		def number_include?(guess , index)
			@secret.include?(guess[index]) && !exact_match?(guess , index)
		end
	end
end