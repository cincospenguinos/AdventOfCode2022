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

    OUTCOMES = {
      'X' => :lose,
      'Y' => :draw,
      'Z' => :win,
    }

    RPS_WINNERS = {
      rock: :scissors,
      paper: :rock,
      scissors: :paper,
    }

    RPS_LOSERS = {
      rock: :paper,
      paper: :scissors,
      scissors: :rock,
    }

    RPS_POINTS = {
      rock: 1,
      paper: 2,
      scissors: 3,
    }

    attr_reader   :opponent_play
    attr_reader   :outcome
    attr_accessor :my_play

    def initialize(str)
      split = str.split(/\s+/)
      @opponent_play = RPS_MAPPINGS[split[0]]
      @my_play = RPS_MAPPINGS[split[1]]
      @outcome = OUTCOMES[split[1]]
    end

    def points
      RPS_POINTS[my_play] + outcome_points
    end

    def adjust_play_to_match_outcome
      @my_play = opponent_play if outcome == :draw
      @my_play = RPS_WINNERS[opponent_play] if outcome == :lose
      @my_play = RPS_LOSERS[opponent_play] if outcome == :win
      self
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

  def correct_strategy
    rounds.map { |r| r.adjust_play_to_match_outcome.points }.sum
  end
end
