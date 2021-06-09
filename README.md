# テーブル設計

## userテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_pseudonym    | string | null: false  |
| last_pseudonym     | string | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type                    | Options     |
| ---------------- | ----------------------- | ----------- |
| item_name        | string                  | null: false |
| explanation      | string                  | null: false |
| category_id      | string                  | null: false |
| status_id        | text                    | null: false |
| shipping_fee_id  | string                  | null: false |
| shipping_area_id | string                  | null: false |
| shipping_days_id | string                  | null: false |
| price            | integer                 | null: false |
| user             | references              |             |

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

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | integer    | null: false |
| prefecture   | string     | null: false |
| municipality | string     | null: false |
| house_number | string     | null: false |
| building     | string     |             |
| phone_number | integer    | null: false |
| purchase_id  | references |             |

### Association

- belongs_to :purchase
