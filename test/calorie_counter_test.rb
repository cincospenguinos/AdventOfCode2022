# frozen_string_literal: true

require "test_helper"

class CalorieCounterTest < Minitest::Test
	EXAMPLE_INPUT = <<~STR
		1000
		2000
		3000

		4000

		5000
		6000

		7000
		8000
		9000

		10000
	STR

	def test_counting_calories_works
		counter = AdventOfCode2022::CalorieCounter.new(EXAMPLE_INPUT)
		assert_equal 24000, counter.max_calories_carried
	end

	def test_answers_day_one_part_one
		str = test_input_for(1)
		counter = AdventOfCode2022::CalorieCounter.new(str)
		assert_equal 69501, counter.max_calories_carried
	end

	def test_accepts_top_elves_param
		counter = AdventOfCode2022::CalorieCounter.new(EXAMPLE_INPUT)
		assert_equal 45000, counter.max_calories_carried(3)
	end

	def test_answers_day_one_part_two
		str = test_input_for(1)
		counter = AdventOfCode2022::CalorieCounter.new(str)
		assert_equal 202346, counter.max_calories_carried(3)
	end
end
