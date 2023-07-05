require 'rails_helper'


RSpec.describe OrderAddress, type: :model do
  describe '購入機能実装' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      order = FactoryBot.create(:order, item_id: item.id, user_id: user.id)
      @order_address = FactoryBot.build(:order_address, user_id: order.user_id, item_id: order.item_id)
    end

    

    context '購入できる場合' do
      it '必要な情報を適切に入力して「購入」ボタンを押すと、商品の購入ができる' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも、商品の購入ができる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が必須である' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号のハイフンがないと保存できない' do
        @order_address.post_code = '111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号は、「3桁ハイフン4桁」でなくてはならない' do
        @order_address.post_code = '111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @order_address.post_code = '１１１-１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県が必須である' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須である' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須である' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が必須である' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は12桁以上は保存できない' do
        @order_address.phone_number = '1234567890123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 'is too short. Please input a number with 10 to 11 digits")
      end
      it '電話番号は9桁以下は保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number 'is too short. Please input a number with 10 to 11 digits")
      end
      it '電話番号は半角数値のみ保存可能' do
        @order_address.phone_number = '１１１１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐づいていないと保存できない" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていないと保存できない" do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

