require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録' do
    it 'first_name、last_nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")  # 修正
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end
end