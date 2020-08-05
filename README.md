# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| -----------        | ---------- | ------------------------------ |
| first_name         | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_furigana     | string     | null: false                    |
| family_furigana    | string     | null: false                    |
| email              | string     | null: false                    |
| nickname           | string     | null: false                    |
| birth              | data       | null: false                    |
| password           | string     | null: false                    |


### Association

- has_many :items
- has_one  :purchase



## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ---------- | ------------------------------|
| picture               | text       | null: false                   |
| name                  | string     | null: false                   |
| text                  | text       | null: false                   |
| price                 | integer    | null: false                   |
| user                  | references | null: false, foreign_key: true|
| purchase              | references | null: false, foreign_key: true|

#### 以下のitemはdbに保存しない
category_id
item_statue_id 
shipping_charge_id
shipping_area_id
period_until_shipping_id 

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_one    :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to :item

