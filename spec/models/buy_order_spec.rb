require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buy_order = FactoryBot.build(:buy_order,user_id: user.id,item_id:item.id)
  end

  describe '配送先登録' do
    context '登録できる場合' do
      it 'すべての値が正しく入力されている場合、登録できる' do
        expect(@buy_order).to be_valid
      end

      it '建物名が無くても登録できる' do
        @buy_order.bulding_name = ""
        expect(@buy_order).to be_valid
      end
    end

    context '登録できない場合' do
      it '郵便番号が空では登録できない' do
        @buy_order.adress_num = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Adress num は「3桁-4桁」の形式で入力してください。")
      end

      it '郵便番号が「3桁-4桁」の形式でなければ登録できない' do
        @buy_order.adress_num = "1234567"
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Adress num は「3桁-4桁」の形式で入力してください。")
      end

      it '都道府県が空では登録できない' do
        @buy_order.prefecture_id = 1
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @buy_order.first_adress = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("First adress can't be blank")
      end

      it '番地が空では登録できない' do
        @buy_order.second_adress = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Second adress can't be blank")
      end

      it '電話番号が空では登録できない' do
        @buy_order.tel_num = ""
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Tel num can't be blank")
      end

      it '電話番号が10桁未満では登録できない' do
        @buy_order.tel_num = "090123456"
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Tel num は「10桁から11桁の半角数値」で入力してください。")
      end

      it '電話番号が11桁を超えると登録できない' do
        @buy_order.tel_num = "090123456789"
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Tel num は「10桁から11桁の半角数値」で入力してください。")
      end

      it '電話番号が半角数値でなければ登録できない' do
        @buy_order.tel_num = "090-1234-5678"
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Tel num は「10桁から11桁の半角数値」で入力してください。")
      end

      it 'user_idが空では登録できない' do
        @buy_order.user_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @buy_order.item_id = nil
        @buy_order.valid?
        expect(@buy_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end