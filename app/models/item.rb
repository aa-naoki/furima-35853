class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_option presence: true do
    validates :item_name
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end
end
