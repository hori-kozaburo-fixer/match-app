class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where.not(id: current_user.id)
  end

  def search_team
    @users = User.where(team_id: current_user.team_id).where.not(id: current_user.id)
  end

  def search_prefecture
    @users = User.where(prefecture_id: current_user.prefecture_id).where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @reaction = Reaction.where(to_user_id: @user.id).where(from_user_id: current_user.id)
  end

  def follow_team
    @users = User.where(team_id: current_user.team_id).where.not(id: current_user.id)
  end

  def follow_prefecture
    @users = User.where(prefecture_id: current_user.prefecture_id).where.not(id: current_user.id)
  end
end
