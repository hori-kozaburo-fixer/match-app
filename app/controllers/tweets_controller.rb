class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @team = Team.find(params[:id])
    @tweets = Tweet.where(team_id: @team.id)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to tweet_path(@tweet.team_id)
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to tweet_path(@tweet.team_id)
    else
      render :discussion
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to chat_home_index_path
  end

  def discussion
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(tweet_id: @tweet.id)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :team_id).merge(user_id: current_user.id)
  end
end
