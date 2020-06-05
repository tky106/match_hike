class UsersController < ApplicationController
  before_action :set_user

  def list
    @lists = Post.where(contributor_id: current_user.id)
  end

  def show
    
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
