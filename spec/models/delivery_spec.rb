require 'rails_helper'

RSpec.describe Delivery, type: :model do
  before do
    @delivery = FactoryBot.build(:delivery)
  end

  describe '配送先登録' do
    context '登録できる場合' do
      it 'すべての値が正しく入力されている場合、登録できる' do
        expect(@delivery).to be_valid
      end

      it '建物名が無くても登録できる' do
        @delivery.bulding_name = ""
        expect(@delivery).to be_valid
      end
    end

    context '登録できない場合' do
      it '郵便番号が空では登録できない' do
        @delivery.adress_num = ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Adress num は「3桁-4桁」の形式で入力してください。")
      end

      it '郵便番号が「3桁-4桁」の形式でなければ登録できない' do
        @delivery.adress_num = "1234567"
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Adress num は「3桁-4桁」の形式で入力してください。")
      end

      it '都道府県が空では登録できない' do
        @delivery.prefecture_id = nil
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では登録できない' do
        @delivery.first_adress = ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("First adress can't be blank")
      end

      it '番地が空では登録できない' do
        @delivery.second_adress = ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Second adress can't be blank")
      end

      it '電話番号が空では登録できない' do
        @delivery.tel_num = ""
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Tel num can't be blank")
      end

      it '電話番号が10桁未満では登録できない' do
        @delivery.tel_num = "090123456"
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Tel num は「10桁から11桁の半角数値」で入力してください。")
      end

      it '電話番号が11桁を超えると登録できない' do
        @delivery.tel_num = "090123456789"
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Tel num は「10桁から11桁の半角数値」で入力してください。")
      end

      it '電話番号が半角数値でなければ登録できない' do
        @delivery.tel_num = "090-1234-5678"
        @delivery.valid?
        expect(@delivery.errors.full_messages).to include("Tel num は「10桁から11桁の半角数値」で入力してください。")
      end
    end
  end
end