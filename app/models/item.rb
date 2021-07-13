class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :images
    validates :item_name
    validates :explanation
    validates :price,
              numericality: { only_integer: true, message: 'は半角英数字で入力してください。' },
              inclusion: { in: 300..9_999_999, message: 'は300〜9,999,999の間で入力してください。' }
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
