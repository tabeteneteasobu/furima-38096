require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it "全ての値が存在すれば作成できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空だと出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "categoryが空だと出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "conditionが空だと出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "postage_payerが空だと出品できない" do
        @item.postage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it "prefectureが空だと出品できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipment_dateが空だと出品できない" do
        @item.shipment_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment date can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円以下だと出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "price10,000,000円以上だと出品できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが半角数値以外だと出品できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
