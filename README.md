# テーブル設計

## users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| email    | string     | null: false                    |
| nickname | string     | null: false                    |
| birth    | string     | null: false                    |
| password | string     | null: false                    |
| item     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |



### Association

- has_many :items
- has_one  :purchase



## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| picture               | text       | null: false                    |
| name                  | string     | null: false                    |
| text                  | text       | null: false                    |
| category              | string     | null: false                    |
| item_statue           | string     | null: false                    |
| shipping_charge       | string     | null: false                    |
| shipping_area         | string     | null: false                    |
| period_until_shipping | string     | null: false                    |
| price                 | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |
| purchase              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| credit_info      | string     | null: false                    |
| shipping_address | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_one    :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| shipping_address | string | null: false |
| phone_number     | string | null: false |

### Association

- belongs_to :purchase
