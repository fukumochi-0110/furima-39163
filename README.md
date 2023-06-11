# README

## Usersテーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
has_many :items
has_many :orders

## Itemsテーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| item_name     | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| burden_id     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| duration_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
has_one :order
belongs_to :user

## Ordersテーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
|  user  | references | null: false, foreign_key: true |
|  item  | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :address

## Addressesテーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
belongs_to :order
