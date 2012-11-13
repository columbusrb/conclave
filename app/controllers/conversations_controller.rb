class ConversationsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @conversation  = Conversation.find(params[:id], include: {:comments => [:user]})
    @comment       = @conversation.comments.build

    @conversation.mark_as_read!(for: current_user) if current_user
  end

  def new
    @forum         = Forum.find(params[:forum_id])
    @conversation  = @forum.conversations.build
    @comment       = @conversation.comments.build
  end

  def create
    @forum        = Forum.find(params[:forum_id])
    @conversation = @forum.conversations.build(params[:conversation])

    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render action: "new"
    end
  end

  def unstick
    set_flag(:sticky, false)
  end

  def sticky
    set_flag(:sticky, true)
  end

  def unlock
    set_flag(:closed, false)
  end

  def lock
    set_flag(:closed, true)
  end

  protected

  def set_flag(flag, boolean)
    raise "Not so fast there, Sonny" unless flag.to_s =~ /^(closed|sticky)$/

    if current_user.elevated?
      conversation = Conversation.find(params[:id])
      conversation.send("#{flag}=", boolean)
      conversation.save
    end

    redirect_to :back
  end
end
