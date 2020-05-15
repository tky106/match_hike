class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update_apply, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.applicants << current_user
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def show
    
  end

  def update_apply
    @post.update(applicant_ids: current_user.id) unless current_user.id == @post.contributor.id
    redirect_to action: :index
  end

  def edit
    
  end
 
  def update
    if @post.update(update_posts_params)
      redirect_to action: :index
    else
      render action: :edit  
    end
  end


  def destroy
    @post.destroy
    redirect_to action: :index
  end

  private

  def posts_params
    params.require(:post).permit(:title, :purpose, :departure, :destination, :people, :condition, { :applicant_ids => [] }).merge(contributor_id: current_user.id)
  end

  def update_posts_params
    params.require(:post).permit(:title, :purpose, :departure, :destination, :people, :condition, { :applicant_ids => [] })
  end

  def set_post
    @post = Post.find(params[:id])
  end  
end
