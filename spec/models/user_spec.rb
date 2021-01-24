require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context 'ユーザー新規登録ができるとき' do
      it 'nicknameとemailとpasswordが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'nicknameが2文字以上であれば登録できること' do
        @user.nickname = 'pk'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.password = '111111'
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'nicknameが１文字では登録できないこと' do
        @user.nickname = 'p'
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは2文字以上で入力してください")
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'emailに@が含まれない場合登録できないこと' do
        @user.email = 'aaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
    end
  end
end
