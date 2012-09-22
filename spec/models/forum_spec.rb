require 'spec_helper'

describe Forum do
  before do
    @forum = create(:forum)
  end

  it "should be valid" do
    @forum.should be_valid
  end

  describe "validations" do
    it "should require a :title" do
      @forum.title = nil
      @forum.should_not be_valid
    end
  end

  describe "associations" do
    it "should know about any related Conversations" do
      @forum.conversations.should be_empty
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
