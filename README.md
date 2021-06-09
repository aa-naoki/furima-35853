# テーブル設計

## userテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type                    | Options     |
| ------------- | ----------------------- | ----------- |
| item_name     | string                  | null: false |
| explanation   | string                  | null: false |
| category      | string                  | null: false |
| status        | text                    | null: false |
| shipping_fee  | string                  | null: false |
| shipping_area | string                  | null: false |
| date          | string                  | null: false |
| price         | integer                 | null: false |
| image         | ActiveStorageで実装     |             |
| user          | references              |             |

### Association

- belongs_to :user
- has_one    :purchase

## purchasesテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| user          | references |             |
| item          | references |             |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| municipality | string  | null: false |
| house_number | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association

- belongs_to :purchase
