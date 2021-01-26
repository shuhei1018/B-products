class ProductsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
  end

  def new
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(:image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
