# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false, unique: true |
| email               | string  | null: false, unique: true |
| password            | string  | null: false               |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| first_name_furigana | string  | null: false               |
| birth_year          | integer | null: false               |
| birth_month         | integer | null: false               |
| birth_day           | integer | null: false               |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| image            | string     | null: false                     |
| item_name        | string     | null: false                     |
| explanation      | string     | null: false                     |
| category         | string     | null: false                     |
| condition        | string     | null: false                     |
| delivery charge  | string     | null: false                     |
| delivery_days    | string     | null: false                     |
| price            | integer    | null: false                     |
| sales_commission | string     | null: false                     |
| sales_profit     | string     | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| item_image     | string     | null: false                    |
| price          | integer    | null: false                    |
| building name  | string     | null: false                    |
| shipping_fee   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | references | null: false                    |
| municipalities | references | null: false                    |
| address        | string     | null: false                    |
| building name  | references | null: false                    |
| telephone      | integer    | null: false                    |
| buyer          | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer