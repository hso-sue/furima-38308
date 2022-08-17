require 'rails_helper'

RSpec.describe OrderShipinfo, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipinfo = FactoryBot.build(:order_shipinfo, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipinfo).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_shipinfo.building_name = ''
        expect(@order_shipinfo).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipinfo.post_code = ''
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipinfo.post_code = '1234567'
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectures_idを選択していないと保存できないこと' do
        @order_shipinfo.prefectures_id = 1
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_shipinfo.city = ''
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_shipinfo.address = ''
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_shipinfo.telephone_number = nil
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_shipinfo.telephone_number = '123456789'
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_shipinfo.telephone_number = '123456789112'
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_shipinfo.telephone_number = '123456789１０'
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @order_shipinfo.token = nil
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipinfo.user_id = nil
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと購入できない' do
        @order_shipinfo.item_id = nil
        @order_shipinfo.valid?
        expect(@order_shipinfo.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
