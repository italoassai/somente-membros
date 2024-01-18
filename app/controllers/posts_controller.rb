class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index,]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id)
  end


end
