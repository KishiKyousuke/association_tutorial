class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = current_user.comments.build(tweet_id: params[:tweet_id], body: comment_params[:body])
    comment.save
    redirect_to tweet_path(params[:tweet_id])
  end

  def show
    @comment = Comment.find(params[:id])
    @user = User.find(@comment.user_id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to tweet_path(comment.tweet_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
