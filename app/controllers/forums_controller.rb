class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
  end
end
