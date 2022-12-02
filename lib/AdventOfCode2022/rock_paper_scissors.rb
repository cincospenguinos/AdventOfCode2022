# frozen_string_literal: true

class AdventOfCode2022::RockPaperScissors
  class RPSRound
    RPS_MAPPINGS = {
      'A' => :rock,
      'B' => :paper,
      'C' => :scissors,
      'X' => :rock,
      'Y' => :paper,
      'Z' => :scissors,
    }

    RPS_WINNERS = {
      rock: :scissors,
      paper: :rock,
      scissors: :paper,
    }

    RPS_POINTS = {
      rock: 1,
      paper: 2,
      scissors: 3,
    }

    attr_reader   :opponent_play
    attr_accessor :my_play

    def initialize(str)
      split = str.split(/\s+/)
      @opponent_play = RPS_MAPPINGS[split[0]]
      @my_play = RPS_MAPPINGS[split[1]]
    end

    def points
      RPS_POINTS[my_play] + outcome_points
    end

    private

    def outcome_points
      return 3 if my_play == opponent_play
      return 6 if RPS_WINNERS[my_play] == opponent_play
      0
    end
  end

  attr_reader :rounds

  def initialize(input_string)
    @rounds = input_string.split("\n").map { |line| RPSRound.new(line) }
  end

  def direct_strategy
    rounds.map { |r| r.points }.sum
  end
end
