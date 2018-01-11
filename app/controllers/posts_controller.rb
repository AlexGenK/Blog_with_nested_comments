class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  before_action :require_permission, only: [:edit, :destroy]
  
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(date: Time.now)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user.email
    if @post.save then
      redirect_to @post
    else
      render action: 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render action: 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :kind, :date)
  end

  def require_permission
    post = Post.find(params[:id])
    if post.user != current_user.email
      flash[:alert] = 'Only the user who created the post, can delete or edit it'
      redirect_to post
    end
  end
end
