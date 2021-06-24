require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できるとき'
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@purchase_address).to be_valid
    end
    it 'postal_codeにハイフンが含まれていれば購入できる' do
      @purchase_address.postal_code = '123-1234'
      expect(@purchase_address).to be_valid
    end
    it 'postal_codeのハイフン前が3文字の半角数字であれば購入できる' do
      @purchase_address.postal_code = '123-1234'
      expect(@purchase_address).to be_valid
    end
    it 'postal_codeのハイフン後が4文字の半角数字であれば購入できる' do
      @purchase_address.postal_code = '123-1234'
      expect(@purchase_address).to be_valid
    end
    it 'shipping_area_idが1以外なら購入できる' do
      @purchase_address.shipping_area_id = 2
      expect(@purchase_address).to be_valid
    end
    it 'buildingがなくても購入できる' do
      @purchase_address.building = ''
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが半角数字なら購入できる' do
      @purchase_address.phone_number = '09012345678'
      expect(@purchase_address).to be_valid
    end
    it 'phone_numberが半角数字10文字以上11文字以下なら購入できる' do
      @purchase_address.phone_number = '09012345678'
      expect(@purchase_address).to be_valid
    end

    context '商品購入できないとき'
    it 'Userが紐づいていないと購入できない' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'Itemが紐づいていないと購入できない' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
    it 'postal_codeが空では購入できない' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが全角数字では購入できない' do
      @purchase_address.postal_code = '１２３ー１２３４'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'postal_codeにハイフンが含まれていないと購入できない' do
      @purchase_address.postal_code = '1231234'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'postal_codeのハイフン前が2文字以下では購入できない' do
      @purchase_address.postal_code = '12-1234'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'postal_codeのハイフン前が4文字以上では購入できない' do
      @purchase_address.postal_code = '1234-1234'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'postal_codeのハイフン後が3文字以下では購入できない' do
      @purchase_address.postal_code = '123-123'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'postal_codeのハイフン後が5文字以上では購入できない' do
      @purchase_address.postal_code = '123-12345'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
    end
    it 'shipping_area_idが1では購入できない' do
      @purchase_address.shipping_area_id = 1
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it 'municipalityが空では購入できない' do
      @purchase_address.municipality = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberが空では購入できない' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空では購入できない' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字では購入できない' do
      @purchase_address.phone_number = '０９０１２３４５６７８'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end
    it 'phone_numberが9文字以下では購入できない' do
      @purchase_address.phone_number = '090123456'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is too short')
    end
    it 'tokenが空では購入できない' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
