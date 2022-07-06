# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| fullname           | string | null: false |
| name.kana          | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                    | Type    | Options     |
| ------------------------- | ------- | ----------- |
| item.name                 | string  | null: false |
| price                     | integer | null: false |
| delivery.charge           | integer | null: false |
| explanation               | text    | null: false |
| category                  | string  | null: false |
| quality                   | string  | null: false |
| shipment.source.address   | string  | null: false |
| shipping.date             | string  | null: false |
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

- belongs_to :item
- has_one :addresses

## addresses テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| town            | string     | null: false |
| building        | string     | null: false |
| city            | string     | null: false |
| province        | string     | null: false |
| post.code       | string     | null: false |
| phone.number    | integer    | null: false |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
