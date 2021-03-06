class TweetsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
 
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(image: tweet_params[:image], image2: tweet_params[:image2], image3: tweet_params[:image3], text: tweet_params[:text], user_id: current_user.id)
  end

  def update
    tweet = Tweet.find(params[:id])
      tweet.update(tweet_params) if tweet.user_id == current_user.id 
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  
  def tweet_params
    params.permit(:image, :image2, :image3, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
