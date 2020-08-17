require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入情報の保存" do
    before do
      @buyer = FactoryBot.build(:user)
      @seller = FactoryBot.build(:user)
      item = FactoryBot.build(:item, user_id: @seller.id)
      item.image = fixture_file_upload("/files/afdgbf.jpg")
      item.save
      @order_address = FactoryBot.build(:order_address, user_id: @buyer.id, item_id: item.id)
    end

    context "購入がうまくいくとき" do
      it "全ての入力欄が埋まっているとき" do
        expect(@order_address).to be_valid
      end
    end

    context "購入がうまくいかないとき" do
      it "郵便番号は半角のハイフンを含んだ正しい形式でないと保存できないこと" do
        @order_address.postal_code = 1234432
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
      it "市区町村の情報が平仮名、カタカナ、漢字以外の時" do
        @order_address.city = "tokyo"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is invalid")
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
      it "電話番号の情報にハイフンが用いられているとき" do
        @order_address.phone_number = 123-4568-9009
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号の情報が11桁以上の時" do
        @order_address.phone_number = 1232145689009
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
