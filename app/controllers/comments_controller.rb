class CommentsController < ApplicationController
  before_action :set_comment, only: [:create, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.product_id = params[:product_id]
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @product = Product.find(params[:product_id])
    @comments = @product.comments.order(created_at: :desc)
  end
end
