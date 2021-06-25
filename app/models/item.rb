class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price,
              numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
              inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
