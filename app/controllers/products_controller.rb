class ProductsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
