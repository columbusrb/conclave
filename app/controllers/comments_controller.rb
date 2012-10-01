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

    @comment = @conversation.comments.new({
      content: params[:comment][:comment][:content],
      user_id: current_user.id
    })

    respond_to do |format|
      if @comment.save
        if params[:comment][:comment][:uploaded_files].present?
          @uploaded_file = @comment.uploaded_files.create(params[:comment][:comment][:uploaded_files])
        end

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
