class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum                 = Forum.find(params[:id])
    @sticky_conversations  = @forum.conversations.sticky
    @regular_conversations = @forum.conversations.regular.page(params[:regular]).per(20)
    @closed_conversations  = @forum.conversations.closed.page(params[:closed]).per(10)
  end
end
