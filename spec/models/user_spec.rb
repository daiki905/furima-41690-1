require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録ができない場合' do
    context '必須項目に関するエラーチェック' do
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'birthが空では登録できない' do
        @user.birth = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end

    context 'メールアドレスに関するエラーチェック' do
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        expect(another_user).not_to be_valid
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'userexample.com'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end

    context 'パスワードに関するエラーチェック' do
      it 'passwordが空では登録できない' do
        @user.password = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = @user.password_confirmation = '12345'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = @user.password_confirmation = 'abcdef'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む必要があります')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = @user.password_confirmation = '123456'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む必要があります')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = @user.password_confirmation = 'password１'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含む必要があります')
      end

      it 'パスワード(確認用)が一致しない場合は登録できない' do
        @user.password_confirmation = 'different'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end

    context '名前のバリデーション' do
      it '姓に半角文字が含まれていると登録できない' do
        @user.last_name = 'Yamada'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Last name は全角文字で入力してください")
      end

      it '名が空だと登録できない' do
        @user.first_name = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名に半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("First name は全角文字で入力してください")
      end

      it '姓(カナ)が空だと登録できない' do
        @user.last_name_katakana = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it '姓(カナ)にカタカナ以外の文字が含まれていると登録できない' do
        @user.last_name_katakana = 'やまだ'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Last name katakana はカタカナのみで入力してください")
      end

      it '名(カナ)が空だと登録できない' do
        @user.first_name_katakana = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it '名(カナ)にカタカナ以外の文字が含まれていると登録できない' do
        @user.first_name_katakana = 'たろう'
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("First name katakana はカタカナのみで入力してください")
      end
    end

    context '生年月日のバリデーション' do
      it '生年月日が空だと登録できない' do
        @user.birth = ''
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end