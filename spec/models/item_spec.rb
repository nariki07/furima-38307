require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do

    context "商品出品ができる時" do
      it "image,item,text,category_id,status_id,deliverycharge_id,area_id,delivery_days_id,price,user_idが存在すれば出品できる" do
      expect(@item).to be_valid
      end
    end

    context "商品出品ができない時" do

    it "商品画像がなければ出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がなければ出品できない" do
      @item.item = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item can't be blank")
    end
    
    it "商品の説明がなければ出品できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    
    it "カテゴリー選択欄で---が選択されている時は出品できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品状態の選択欄で---が選択されている時は出品できない" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "配送料の負担の選択欄で---が選択されている時は出品できない" do
      @item.deliverycharge_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliverycharge can't be blank")
    end

    it "配送元の地域選択欄で---が選択されている時は出品できない" do
      @item.area_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it "配達日の選択欄で---が選択されている時は出品できない" do
      @item.delivery_days_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days can't be blank")
    end

    it "販売価格の情報が無ければ出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "販売価格が¥300より安い時は出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    
    it "販売価格が¥9,999,999より高い時は出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "販売価格は半角数値のみ保存可能であること" do
      @item.price = "テスト"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "ユーザーが紐付いてなければ保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
  end
end
