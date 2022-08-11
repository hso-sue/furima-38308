require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規ユーザー情報登録' do
    context '新規登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'item_categoryが空では登録できない' do
        @item.item_category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_conditionが空では登録できない' do
        @item.item_condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'postage_payerが空では登録できない' do
        @item.postage_payer_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it 'sender_areaが空では登録できない' do
        @item.sender_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender area can't be blank")
      end
      it 'preparationが空では登録できない' do
        @item.preparation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparation can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格は300円以上でなければ登録できない' do
        @item.price = '22'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は9,999,999円以下でなければ登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数値でなければ登録できない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'user_idが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
