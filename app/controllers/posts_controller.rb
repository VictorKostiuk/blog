class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'article successfully created'
    else
      render :new, danger: 'article not created'
    end
  end

  def edit

  end

  def update

    if @post.update_attributes(post_params)
      redirect_to @post, success: 'article updated successfully'
    else
      render :edit, danger: 'article not updated'
    end
  end

  def destroy

    @post.destroy
    redirect_to posts_path, success: 'article successfully deleted'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end
end