class CommentsController < ApplicationController
  before_action :get_parent

  def new
    @comment = @parent.comments.new
  end
 
  def create
    @comment = @parent.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end
 
  protected
   
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
