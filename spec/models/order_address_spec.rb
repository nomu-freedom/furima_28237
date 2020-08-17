require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入情報の保存" do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context "購入がうまくいくとき" do
      it "全ての入力欄が埋まっているとき" do
        expect(@order_address).to be_valid
      end
    end

    context "購入がうまくいかないとき" do
      it "郵便番号の情報が正しくないとき" do
        @order_address.postal_code = 1234-432
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "郵便番号の情報が空の時" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県の選択がされていないとき" do
        @order_address.shipping_origin_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping origin can't be blank")
      end
      it "市区町村の情報が空の時" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地の情報が空の時" do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号の情報が正しくない時" do
        @order_address.phone_number = 123456789009
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号の情報が空の時" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
