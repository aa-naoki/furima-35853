require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき'
    it 'image,item_name,explanation,price,category_id,status_id,shipping_fee_id,shipping_area_id,shipping_day_idが存在すれば出品できる' do
      expect(@item).to be_valid
    end
    it 'priceの入力が半角であれば出品できる' do
      @item.price = '10000'
      expect(@item).to be_valid
    end
    it 'priceの入力が300~9,999,999の間であれば出品できる' do
      @item.price = '10000'
      expect(@item).to be_valid
    end
    it 'category_idが1以外なら出品できる' do
      @item.category_id = 2
      expect(@item).to be_valid
    end
    it 'status_idが1以外なら出品できる' do
      @item.status_id = 2
      expect(@item).to be_valid
    end
    it 'shipping_fee_idが1以外なら出品できる' do
      @item.shipping_fee_id = 2
      expect(@item).to be_valid
    end
    it 'shipping_area_idが1以外なら出品できる' do
      @item.shipping_area_id = 2
      expect(@item).to be_valid
    end
    it 'shipping_day_idが1以外なら出品できる' do
      @item.shipping_day_id = 2
      expect(@item).to be_valid
    end

    context '商品出品できないとき'
    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_nameが空だと出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'explanationが空だと出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceの入力が半角英数混合の場合出品できない' do
      @item.price = '100aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
    end
    it 'priceの入力が半角英語だけでは出品できない' do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
    end
    it 'priceの入力が全角の場合出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
    end
    it 'priceの入力が300以下の場合出品できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'priceの入力が10,000,000以上の場合出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
    it 'category_idが1だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが1だと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'shipping_fee_idが1だと出品できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it 'shipping_area_idが1だと出品できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'shipping_day_idが1だと出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it 'Userが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
