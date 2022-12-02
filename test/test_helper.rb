# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "AdventOfCode2022"

require "minitest/autorun"
require "byebug"

def test_input_for(day)
	File.read("test/test_data/day_#{day}.txt")
end
