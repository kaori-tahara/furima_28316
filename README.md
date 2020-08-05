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
| birth              | date       | null: false                    |
| password           | string     | null: false                    |


### Association

- has_many :items
- has_many :purchases
- has_many :comments



## items テーブル

| Column                  | Type       |Options                      |
| --------------------    | ---------- | -------------------------   |
| picture                 | text       | null:false                  |
| name                    | string     | null:false                  |
| text                    | text       | null:false                  |
| price                   | integer    | null:false                  |
| user                    | references | null: false,foreign_key:true|
| category                | integer    | null:false                  |
| item_statue             | integer    | null:false                  |
| shipping_charge         | integer    | null:false                  |
| prefecture              | integer    | null:false                  |
| period_until_shipping   | integer    | null:false                  |

### Association

- belongs_to :user
- has_one    :purchase
- has_one    :shipping_address
- has_many   :comments


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| zip           | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item


## comments テーブル
| Column           | Type       | Options                        |
| ---------------  | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| text             | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item



#### 以下のitemはdbに保存しない
category_id
item_statue_id 
shipping_charge_id
prefecture_id
period_until_shipping_id 


