require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき'
    it '全ての値が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
    it 'priceの入力が半角であれば出品できる' do
      @item.price = 10_000
      expect(@item).to be_valid
    end
    it 'priceの入力が300~9,999,999の間であれば出品できる' do
      @item.price = 10_000
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
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品画像を入力してください')
    end
    it 'item_nameが空だと出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end
    it 'explanationが空だと出品できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格を入力してください')
    end
    it 'priceの入力が半角英数混合の場合出品できない' do
      @item.price = '100aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角英数字で入力してください。')
    end
    it 'priceの入力が半角英語だけでは出品できない' do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角英数字で入力してください。')
    end
    it 'priceの入力が全角の場合出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は半角英数字で入力してください。')
    end
    it 'priceの入力が300以下の場合出品できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300〜9,999,999の間で入力してください。')
    end
    it 'priceの入力が10,000,000以上の場合出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300〜9,999,999の間で入力してください。')
    end
    it 'category_idが1だと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it 'status_idが1だと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end
    it 'shipping_fee_idが1だと出品できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end
    it 'shipping_area_idが1だと出品できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it 'shipping_day_idが1だと出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end
    it 'Userが紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
  end
end
