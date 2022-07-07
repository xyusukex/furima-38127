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
- has_many :purchases

## items テーブル

| Column                    | Type    | Options     |
| ------------------------- | ------- | ----------- |
| item_name                 | string  | null: false |
| price                     | integer | null: false |
| delivery_charge           | integer | null: false |
| explanation               | text    | null: false |
| category                  | string  | null: false |
| quality                   | string  | null: false |
| shipment_source_address   | string  | null: false |
| shipping_date             | string  | null: false |
| user                      | string  | null: false, foreign_key: true |


### Association

- belongs_to  :user
- has_one     :purchases

## purchases テーブル

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
| province        | string     | null: false |
| post_ode        | string     | null: false |
| phone_number    | string     | null: false |
| purchases       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
