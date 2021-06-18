class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence:true do
    validates :postal_code, 
              format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :shipping_area_id,
              numericality: { other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :house_number
    validates :phone_number,
              format: {with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input only number'}
    validates :purchase
  end
end
