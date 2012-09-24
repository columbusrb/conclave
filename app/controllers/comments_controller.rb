class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @comments = @conversation.comments
    @comment = Comment.new
  end
  
  def new
    @conversation = Conversation.find(params[:conversation_id])
    @comment = Comment.new
  end
  
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @comment = Comment.new do |c|
      c.conversation = @conversation
      c.content = params[:comment][:content]
      c.user = current_user
    end
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to conversation_comments_path(@conversation), notice: "Comment was added successfully" }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def edit
    @conversation = Conversation.find(params[:conversation_id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to conversation_comments_path(@comment.conversation), notice: "Comment was successfully updated"
    else
      render action: 'edit'
    end
  end
end
