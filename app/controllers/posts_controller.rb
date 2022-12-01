class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy!
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
