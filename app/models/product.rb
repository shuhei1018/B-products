class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :user
  validates :status_id, numericality: { other_than: 1 }
end
