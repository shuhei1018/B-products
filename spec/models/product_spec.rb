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

    context '製品投稿ができないとき' do
      it '製品投稿画像が空の場合、投稿できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("投稿製品画像を入力してください")
      end
      it '製品名が空の場合、投稿できないこと' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("製品名を入力してください")
      end
      it '製品状態が0の場合、投稿できないこと' do
        @product.status_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("製品状態は0以外の値にしてください")
      end
      it '製品説明が空の場合、投稿できないこと' do
        @product.explanation = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("製品説明を入力してください")
      end
    end
  end
end
