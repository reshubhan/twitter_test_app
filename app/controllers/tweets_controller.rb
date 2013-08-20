class TweetsController < ApplicationController
  def index
    @user_tweets_ids = ReTweet.where("user_id =? ", current_user.id).pluck(:tweet_id)
    @user_retweets = Tweet.find(@user_tweets_ids)
    @tweets = Tweet.all
  end

  def all_tweets
    @tweets = current_user.tweets
    @retweets = ReTweet.where("user_id =? ", current_user.id)
  end

  def new
  	@tweet = Tweet.new
  end

  def edit
    @tweet  = Tweet.find_by_id(params[:id])
  end

  def update
    @tweet  = Tweet.find_by_id(params[:id])
    @tweet.update_attributes(params[:tweet])
    if @tweet.save
      redirect_to :action  => "index"
    else
      flash[:notice] = "#{@tweet.errors.messages}"
      redirect_to(:back)
    end
  end

  def create
  	user  = current_user
  	@tweet = user.tweets.create(params[:tweet])
  	if @tweet.save
  		redirect_to tweet_path(@tweet)
  	else
  		redirect_to :action => :new
  	end
  end

  def show 
  	@tweet  = Tweet.find_by_id(params[:id])
  end

  def tweet_again
    @tweet  = Tweet.find_by_id(params[:id])
    @retweet =  ReTweet.create(:tweet_id => @tweet.id, :user_id => current_user.id)
    redirect_to :action => "index"
  end

  def destroy
      @tweet  = Tweet.find_by_id(params[:id])
      @retweets = ReTweet.find_by_tweet_id(@tweet.id)
      @retweets.delete_all unless @retweets.blank?
      @tweet.destroy
      flash[:notice] = "Tweet has been deleted."
      redirect_to :action => "index"
    end
end
