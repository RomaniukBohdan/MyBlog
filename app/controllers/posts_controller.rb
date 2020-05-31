class PostsController < ApplicationController
  def index
    @post=Post.all
  end

  def new
    @post=Post.new
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if(@post.update(post_param))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

   def create
     @post=Post.new(post_param)
     @post.user=current_user
     if(@post.save)
     redirect_to @post
     else
       render 'new'
     end
   end

  private def post_param
    params.require(:post).permit(:title,:body)
  end
end
