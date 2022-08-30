require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id,item_id: item.id)
  end

  describe "商品購入機能" do

    context "商品購入ができる時" do
      it "すべての値が正しく入力されていれば購入できること" do
      expect(@order_delivery).to be_valid
      end

      it "buildingは空でも保存ができること" do
      @order_delivery.building = "" 
      expect(@order_delivery).to be_valid
      end
    end

    context "商品購入ができない時" do

      it "トークンが発行されていなければ購入できない" do
        @order_delivery.token = ""
        @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    
      it "郵便番号が空では購入できない" do
      @order_delivery.postcode = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      
      it "郵便番号は3桁ハイフン4桁の半角文字列でなければ購入できない" do
      @order_delivery.postcode = "1234567"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postcode is invalid")
      end

      it "都道府県が空では購入できない" do
      @order_delivery.area_id = "0"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Area can't be blank")
      end
    
      it "市区町村が空では購入できない" do
      @order_delivery.city = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      
      it "番地が空では購入できない" do
      @order_delivery.block = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Block can't be blank")
      end

      it "電話番号が空では購入できない" do
      @order_delivery.phone_number = ""
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号は9桁以下では登録できない" do
      @order_delivery.phone_number = "123456789"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
    
      it "電話番号は12桁以上では登録できない" do
      @order_delivery.phone_number = "123456789000"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号は全角文字では登録できない" do
      @order_delivery.phone_number = "１２３４５６７８９０"
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
