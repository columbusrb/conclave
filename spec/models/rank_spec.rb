require 'spec_helper'

describe Rank do
  before(:each) do
    @rank = create(:rank)
  end
  describe "validations" do
    it "must have an integer for a comment_threshold" do
      @rank.comment_threshold = 'abc123'
      @rank.should_not be_valid
    end
    it "should have unique comment_thresholds" do
      new_rank = build(:rank)
      new_rank.comment_threshold = @rank.comment_threshold
      new_rank.should_not be_valid
    end
    it "should have unique names" do
      new_rank = build(:rank)
      new_rank.name = @rank.name
      new_rank.should_not be_valid
    end
    it "should have a comment_threshold" do
      @rank.comment_threshold = nil
      @rank.should_not be_valid
    end
    it "should have a name" do
      @rank.name = nil
      @rank.should_not be_valid
    end
  end
end
