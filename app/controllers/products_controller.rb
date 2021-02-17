class ProductsController < ApplicationController
  before_action :set_production, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:destroy, :edit]
  before_action :search_product, only: [:index, :search]
  def index
    @products = Product.with_attached_image.includes(:user).order(created_at: :desc).page(params[:page]).per(6)
  end

  def search
    @products = @p.result.page(params[:page]).per(6)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @product.comments.order(created_at: :desc)
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :status_id, :explanation, :price).merge(user_id: current_user.id)
  end

  def set_production
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @product.user_id
  end

  def search_product
    @p = Product.ransack(params[:q])
  end
end
