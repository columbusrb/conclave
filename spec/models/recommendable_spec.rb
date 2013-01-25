require 'spec_helper'

describe "Recommendable" do 
  context "Discussions" do 
    before :each do
      @user = create(:user)
      @conversation = create(:conversation)
    end
    context "Like" do
      before :each do
        @user.like @conversation
      end
      it { (@user.likes? @conversation).should be_true }
      it { @conversation.liked_by_count.should eq 1 }
      it { @user.rated?(@conversation).should be_true }
      it { @user.likes.should include @conversation }
      it { @user.dislikes.should_not include @conversation }
    end
    context "dislike" do
      before :each do
        @user.dislike @conversation
      end
      it { (@user.dislikes? @conversation).should be_true }
      it { @conversation.disliked_by_count.should eq 1 }
      it { @user.rated?(@conversation).should be_true }
      it { @user.dislikes.should include @conversation }
      it { @user.likes.should_not include @conversation }
    end
    context "hide" do
      # before { @user.hide(@conversation) }
      # it { @user.hides?(@conversation).should be_true }
      # it { @user.rated?(@conversation).should be_true }
      # it { @user.hiding.should include @conversation }
      # it { @user.dislikes.should_not include @conversation }
      # it { @user.likes.should_not include @conversation }
    end
  end
end