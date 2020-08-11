require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.build(:item)
    end

    describe "商品の保存" do
      context "商品の保存できる場合" do
        it "全ての項目が存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end

      context "商品が保存できない場合" do
        it "画像が1枚もない時" do
          @item.image = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "商品名がない時" do
          @item.name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明がない時" do
          @item.explanation = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it "カテゴリーの情報がない時" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "商品の状態の情報がない時" do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end
        it "発送料の負担の情報がない時" do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end
        it "発送元の地域の情報がない時" do
          @item.shipping_origin_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping origin must be other than 1")
        end
        it "発送までの日数についての情報がない時" do
          @item.until_shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Until shipping must be other than 1")
        end
        it "価格についての情報がない時" do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
        end
        it "価格設定が¥299以下の時" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "価格設定が¥10000000以上の時" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
      end
    end
  end
end
