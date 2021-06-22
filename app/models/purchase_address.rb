class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :house_number, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, 
              format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :shipping_area_id,
              numericality: { other_than: 0 }
    validates :municipality
    validates :house_number
    validates :phone_number,
              format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input only number'}
  end
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end