require 'spec_helper'

describe Topic do
  before(:each) do
    @attr = { 
      name: "General",
      description: "General Conversation",
      slug: 'g'
    }
  end

  it "should create a new instance given a valid attribute" do
    Topic.create!(@attr)
  end

  it "should require a name" do
    no_name_topic = Topic.new(@attr.merge(:name => ""))
    no_name_topic.should_not be_valid
  end

  it "should require a description" do
    empty_description = Topic.new(@attr.merge(description: ""))
    empty_description.should_not be_valid
  end

  it "should require a slug" do
    empty_slug = Topic.new(@attr.merge(slug: ""))
    empty_slug.should_not be_valid
  end


  it "should not accept duplicates" do
    Topic.create!(@attr)
    topic_with_duplicate_name = Topic.new(@attr)
    topic_with_duplicate_name.should_not be_valid
  end

  it "should require lowercase letter and number only slugs" do
    ['Az 89', '!!-!', '   '].each do |bad_slug|
      bad_slug_topic = Topic.new(@attr.merge(slug: bad_slug))
      bad_slug_topic.should_not be_valid
    end
  end



end
