# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| images         | string     | null: false       |
| item           | string     | null: false       |
| text           | text       | null: false       |
| category       | string     | null: false       |
| status         | string     | null: false       |
| deliverycharge | string     | null: false       |
| area           | string     | null: false       |
| delivery_days  | string     | null: false       |
| price          | string     | null: false       |
| user           | references | foreign_key: true |

### Association

- belongs_to :users
- has_many :comments
- has_one :orders

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## orders テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| credit_number   | string | null: false |
| limit_month     | string | null: false |
| limit_year      | string | null: false |
| security_number | string | null: false |
| postcode        | string | null: false |
| prefecture_id   | string | null: false |
| city            | string | null: false |
| block           | string | null: false |
| building        | string |             |
| phone_number    | string | null: false |

### Association

- belongs_to :items
