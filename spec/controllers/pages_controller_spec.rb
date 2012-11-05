require 'spec_helper'

describe PagesController do

  before do
    @page = create(:page)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: @page.permalink
      response.should be_success
    end
  end

end
