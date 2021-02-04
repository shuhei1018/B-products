class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comments.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :product_id, :user_id)
  end
end
