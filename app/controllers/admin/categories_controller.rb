class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:edit, :update, :destroy ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, success: 'Категорія успішно створена'
    else
      @categories = Category.all.order(:name)
      flash[:danger] = 'Категорія не створена'
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, success: 'Категорія успішно відредагована'
    else
      @categories = Category.where("id != #{category.id}").order(:name)
      flash[:danger] = 'Категорія не відредагована'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, success: 'Категорія успішно видалена'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

end