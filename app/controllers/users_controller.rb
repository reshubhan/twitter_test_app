class UsersController < ApplicationController
    
	def index
	  @follows = current_user.following_users
	  @users  = User.where("id != ?", current_user.id)
	end

	def show
	  @user  = User.find_by_slug(params[:id]) 
	end

	def edit
	  @user  = User.find_by_slug(params[:id]) 
	end

	def update
	  @user  = User.find_by_slug(params[:id]) 
	  @user.update_attributes(params[:user])
	  if @user.save
	    redirect_to user_path(@user)
	  else
	  	flash[:notice] = "#{@user.errors.messages}"
	    redirect_to(:back)
	  end
	end

	def new
	  @user  = User.new
	end

	def follow
	  @user  = User.find_by_slug(params[:id]) 
	  current_user.follow(@user)
	  @users  = User.where("id != ?", current_user.id)
	  @follows = current_user.following_users
	  render :action => "index"
	end

	def unfollow
	  @user  = User.find_by_slug(params[:id]) 
	  current_user.stop_following(@user)
	  @users  = User.where("id != ?", current_user.id)
	  @follows = current_user.all_following
	  render :action => "index"
	end

	def all_follows
	  @user = User.find_by_slug(params[:id])
	  @follows = @user.all_following
	end

	def all_tweets
      @tweets = current_user.tweets
      @retweets_ids = ReTweet.where("user_id =? ", current_user.id).pluck(:tweet_id)
      @retweets = Tweet.find(@retweets_ids)
    end

    def destroy
      @user  = User.find_by_slug(params[:id])
      @user.destroy
      flash[:notice] = "User has been deleted."
      redirect_to :action => "index"
    end
end
