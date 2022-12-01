# frozen_string_literal: true

class AdventOfCode2022::CalorieCounter
	class Elf
		attr_reader :foods

		def initialize(foods)
			@foods = foods
		end

		def total_calories
			foods.sum
		end
	end

	def initialize(str)
		@elves = input_str_to_elves(str) 
	end

	def max_calories_carried
		@elves.map { |e| e.total_calories }.max
	end

	private

	def input_str_to_elves(input_string)
		input_string.split("\n\n")
			.map { |str| str.split("\n") }
			.map do |array|
				foods = array.map { |element| element.split("\n").map(&:to_i) }
					.flatten
				Elf.new(foods)
			end
	end
end