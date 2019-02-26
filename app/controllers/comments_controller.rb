class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
    redirect_to "/tweets/#{@comment.tweet.id}"
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    comment = Comment.find(params[:id])
    if tweet.user_id
      comment.destroy
      redirect_to tweet_path(id: tweet.id), flash: {success: "コメントを削除しました"}
    end
  end

  private
  def commet_params
    params.permit(:text, :tweet_id)
  end
end
