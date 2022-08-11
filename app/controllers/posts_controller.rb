class PostsController < ApplicationController
  before_action :set_post, only: :show

  def index
    @posts = Post.published.paginate(page: params[:page], per_page: 5)
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, success: 'article successfully created'
    else
      render :new, danger: 'article not created'
    end
  end
  def show

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end