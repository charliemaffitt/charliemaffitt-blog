class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to admin_posts_path
    else
      flash[:error] = "Post could not be created"
      render :new
    end
  end

  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post Updated"
      redirect_to admin_posts_path
    else
      flash[:error] = "Post could not be updated"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = "Post Destroyed"
      redirect_to admin_posts_path
    else
      flash[:error] = "Post could not be destroyed"
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :raw_body)
  end
end