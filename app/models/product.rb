class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :user
  has_many :comments , dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_one_attached :image
  validates :image, :name, :explanation, presence: true
  validates :status_id, numericality: { other_than: 0 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
