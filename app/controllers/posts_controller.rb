class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new(date: Time.now)
  end

  def create
    @post=Post.new(post_params)
    if @post.save then
      redirect_to @post
    else
      render action: 'new'
    end
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])

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
end
