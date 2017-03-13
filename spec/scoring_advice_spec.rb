# -*- encoding: utf-8 -*-
require_relative '../lib/scoring_advice'

describe ScoringAdvice do
  describe "#ul" do

    it ":expect create an unordered list" do
      ScoringAdvice.ul(['foo', 'bar']).should eql "<ul><li>foo</li><li>bar</li></ul>"
    end

    it ":expect escape appropriate characters" do
      ScoringAdvice.ul(['<élan>']).should match %r(&lt;&eacute;lan&gt;)
    end

  end
end