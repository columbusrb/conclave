class ConversationsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @conversation  = Conversation.find(params[:id], include: {:comments => [:user, :uploaded_files]})
    @comment       = @conversation.comments.build
    @uploaded_file = @comment.uploaded_files.build
  end

  def new
    @forum         = Forum.find(params[:forum_id])
    @conversation  = @forum.conversations.build
    @comment       = @conversation.comments.build
    @uploaded_file = @comment.uploaded_files.build
  end

  def create
    @forum        = Forum.find(params[:forum_id])
    @conversation = @forum.conversations.build(params[:conversation])

    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      # It seems that this gets lost...
      @conversation.comments.first.uploaded_files.build
      render action: "new"
    end
  end
end
