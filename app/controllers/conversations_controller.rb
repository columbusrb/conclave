class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @forum = Forum.find(params[:forum_id])
    @conversation = Conversation.new
    @comment = Comment.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @comment = Comment.new
    @conversation = Conversation.new do |c|
      c.forum = @forum
      c.title = params[:conversation][:title]
      @comment.content = params[:conversation][:comment][:content]
      @comment.user = current_user
      c.comments << @comment
    end
    @comment.conversation = @conversation
    if @conversation.save!
      redirect_to conversation_comments_path(@conversation)
    else
      render action: "new"
    end
  end
end
