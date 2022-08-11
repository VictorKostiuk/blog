class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [ :edit, :update, :destroy]

  def index
    @posts = Post.for_processing
  end
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, success: 'article successfully created'
    else
      render :new, danger: 'article not created'
    end
  end

  def update_status
    @post = Post.find(params[:id])
    @post.update(status: params[:status])
    redirect_to @post
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
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id, :post_id)
  end
end