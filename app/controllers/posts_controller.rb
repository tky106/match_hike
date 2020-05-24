class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update_apply, :complete, :update, :destroy]

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
    if @post.update(update_posts_params)
      @post.applicants << current_user
    end  
    redirect_to complete_post_path
  end

  def complete

  end

  def search
    if params[:destination].present?
      @posts = Post.where('destination LIKE ?', "%#{params[:destination]}%").order("created_at DESC")
    elsif params[:departure].present?
      @posts = Post.where('departure LIKE ?', "%#{params[:departure]}%").order("created_at DESC")
    elsif params[:purpose].present?
      @posts = Post.where('purpose LIKE ?', "%#{params[:purpose]}%").order("created_at DESC")
    elsif params[:people].present?
      @posts = Post.where('people LIKE ?', "%#{params[:people]}%").order("created_at DESC")
    elsif params[:conditions].present?
      @posts = Post.where('conditions LIKE ?', "%#{params[:conditions]}%").order("created_at DESC")  
    else 
      @posts = Post.none
    end 
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
    params.require(:post).permit(:title, :purpose, :departure, :destination, :people, :conditions, applicant_ids: []).merge(contributor_id: current_user.id)
  end

  def update_posts_params
    params.require(:post).permit(:title, :purpose, :departure, :destination, :people, :conditions, applicant_ids: [] )
  end

  def set_post
    @post = Post.find(params[:id])
  end  
end
