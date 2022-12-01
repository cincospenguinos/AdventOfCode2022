# frozen_string_literal: true

class AdventOfCode2022::CalorieCounter
	attr_reader :elves

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

	def max_calories_carried(top_elves = 1)
		cals = elves.sort { |e1, e2| e2.total_calories <=> e1.total_calories }
			.map(&:total_calories)
		cals[0...top_elves].sum
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