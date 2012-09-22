require 'spec_helper'

describe Forum do
  before do
    @forum = FactoryGirl.create(:forum)
  end

  it "should be valid" do
    @forum.valid?.should be_true
  end

  describe "validations" do
    it "should require a :title" do
      @forum.title = nil
      @forum.valid?.should_not be_true
    end
  end

  describe "associations" do
    it "should know about any related Conversations" do
      @forum.conversations.should == []
    end
  end

  describe "accessible attributes" do
    it "should allow :title" do
      new_title = "Something Else"
      @forum.update_attributes({:title => new_title})
      @forum.title.should == new_title
    end
  end
end
