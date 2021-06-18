class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.strind     :postal_code,      null: false
      t.integer    :shipping_area_id, null: false
      t.strind     :municipality,     null: false
      t.strind     :house_number,     null: false
      t.strind     :building
      t.strind     :phone_number,     null: false
      t.references :purchase,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
