class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @forum        = Forum.find(params[:forum_id])
    @conversation = Conversation.new
    @comment      = Comment.new
  end

  def create
    @forum = Forum.find(params[:forum_id])

    @conversation = @forum.conversations.new do |c|
      c.title   = params[:conversation][:title]
      c.creator = current_user
    end

    if @conversation.save!
      @comment = @conversation.comments.create do |c|
        c.content = params[:conversation][:comment][:content]
        c.user = current_user
      end

      if params[:conversation][:uploaded_files].present?
        @uploaded_file = @comment.uploaded_files.create(params[:conversation][:uploaded_files])
      end

      redirect_to conversation_comments_path(@conversation)
    else
      render action: "new"
    end
  end
end
