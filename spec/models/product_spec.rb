require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '製品投稿' do
    context '製品投稿ができるとき' do
      it 'image, name, status, explanationが存在すれば投稿できること' do
        expect(@product).to be_valid
      end
    end
  end
end
