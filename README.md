# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false,              |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_furigana  | string  | null: false               |
| first_name_furigana | string  | null: false               |
| birth_day           | date    | null: false               |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type       | Options                         |
| ------------------- | ---------- | ------------------------------- |
| item_name           | string     | null: false                     |
| explanation         | text       | null: false                     |
| category_id         | integer    | null: false                     |
| condition_id        | integer    | null: false                     |
| delivery_charge_id  | integer    | null: false                     |
| ship-from_area_id   | integer    | null: false                     |
| delivery_days_id    | integer    | null: false                     |
| price               | integer    | null: false                     |
| sales_commission    | string     | null: false                     |
| sales_profit        | string     | null: false                     |
| user                | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| ship-from_area_id  | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | references |                                |
| telephone          | string     | null: false                    |
| buyer              | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer