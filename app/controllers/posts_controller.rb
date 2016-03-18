class PostsController < ApplicationController
  def index
    if current_user
      @posts = current_user.posts.all
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to '/posts'
    end
    
  end

  def destroy
  end
  
  
   private
    def post_params
      params.require(:post).permit(:title, :body)
    end
  
  
end
