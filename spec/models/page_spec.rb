require 'spec_helper'

describe Page do
  before(:each) do
    @page = create(:page)
  end

  it "should be valid" do
    @page.should be_valid
  end

  describe "validations" do
    it "should require a name" do
      @page.name = nil
      @page.should_not be_valid
    end
    it "should require a permalink" do
      @page.permalink = nil
      @page.should_not be_valid
    end
    it "should not allow 'new' as a permalink" do
      @page.permalink = 'new'
      @page.should_not be_valid
    end
    it "should not allow a duplicate permalink" do
      dupe_permalink = build(:page, permalink: @page.permalink)
      dupe_permalink.should_not be_valid
    end
    it "should require content" do
      @page.content = nil
      @page.should_not be_valid
    end
    it "should have a one string permalink" do
      @page.permalink = 'NEW PERMALINK'
      @page.should_not be_valid
    end
  end

  describe "accessible attributes" do
    it "should allow :name" do
      new_name = 'New Name'
      @page.update_attributes(name: new_name)
      @page.name.should eq new_name
    end
    it "should allow :permalink" do
      new_permalink = 'newpermalink'
      @page.update_attributes(permalink: new_permalink)
      @page.permalink.should eq new_permalink
    end
    it "should allow :content" do
      new_content = 'Lorem Ipsum...'
      @page.update_attributes(content: new_content)
      @page.content.should eq new_content
    end
  end
end
