require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品に関するエラーチェック' do
    context '出品ができる場合' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_manualが空では登録できない' do
        @item.item_manual = ''
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item manual can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = 1
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'item_status_idが空では登録できない' do
        @item.item_status_id = 1
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'shippingsource_idが空では登録できない' do
        @item.shippingsource_id = 1
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Shippingsource can't be blank")
      end

      it 'payee_idが空では登録できない' do
        @item.payee_id = 1
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Payee can't be blank")
      end

      it 'readtime_idが空では登録できない' do
        @item.readtime_id = 1
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Readtime can't be blank")
      end

      it 'item_moneyが空では登録できない' do
        @item.item_money = nil
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item money can't be blank")
      end

      it 'item_moneyが300未満では登録できない' do
        @item.item_money = 299
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item money must be greater than or equal to 300")
      end

      it 'item_moneyが9999999を超えると登録できない' do
        @item.item_money = 10000000
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item money must be less than or equal to 9999999")
      end

      it 'item_moneyに数字以外の文字が入っていると登録できない' do
        @item.item_money = "abc123"
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Item money is not a number")
      end

      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        expect(@item).not_to be_valid
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end