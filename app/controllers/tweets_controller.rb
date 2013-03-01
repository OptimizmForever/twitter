class TweetsController < ApplicationController
 before_filter :require_login
   def index
      @tweets = current_user.tweets
      @tweet = Tweet.new
   end
  def new
    @tweet = current_user.tweets.new
  end
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end
  def create
    @tweet = current_user.tweets.new(params[:tweet])
    if @tweet.save
      #redirect_to tweets_path
    else
      render :new
    end
  end
  def edit
      @tweet = current_user.tweets.find(params[:id])
  end
  def update
      @tweet = current_user.tweets.find(params[:id])
      if @tweet.update_attributes(params[:tweet])
        redirect_to tweets_path
      else
        render :edit
      end
  end
end
