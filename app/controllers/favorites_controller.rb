class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:create, :destroy]
  def create
    favorite = current_user.favorites.new(product_id: @product.id)
    favorite.save
  end

  def destroy
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end

  private

  def set_favorite
    @product = Product.find(params[:product_id])
  end
end