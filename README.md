# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                    | Type        | Options     |
| ------------------------- | ----------- | ----------- |
| item_name                 | string      | null: false |
| price                     | integer     | null: false |
| delivery_charge_id        | integer     | null: false |
| explanation               | text        | null: false |
| category_id               | integer     | null: false |
| quality_id                | integer     | null: false |
| province_id               | integer     | null: false |
| shipping_date_id          | integer     | null: false |
| user                      | references  | null: false, foreign_key: true |


### Association

- belongs_to  :user
- has_one     :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| town            | string     | null: false |
| building        | string     |             |
| city            | string     | null: false |
| province_id     | integer    | null: false |
| post_code       | string     | null: false |
| phone_number    | string     | null: false |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order
