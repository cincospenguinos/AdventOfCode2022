# frozen_string_literal: true

require "test_helper"

class RockPaperScissorsTest < Minitest::Test
  EXAMPLE_INPUT = <<~STR
    A Y
    B X
    C Z
  STR

  def test_calculates_direct_strategy
    rps = AdventOfCode2022::RockPaperScissors.new(EXAMPLE_INPUT)
    assert_equal 15, rps.direct_strategy
  end

  def test_answers_part_one
    str = test_input_for(2)
    rps = AdventOfCode2022::RockPaperScissors.new(str)
    assert_equal 12794, rps.direct_strategy
  end

  def test_calculates_correct_strategy
    rps = AdventOfCode2022::RockPaperScissors.new(EXAMPLE_INPUT)
    assert_equal 12, rps.correct_strategy
  end

  def test_answers_part_two
    str = test_input_for(2)
    rps = AdventOfCode2022::RockPaperScissors.new(str)
    assert_equal 14979, rps.correct_strategy
  end
end
