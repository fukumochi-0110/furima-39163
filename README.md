# README

## Usersテーブル

| Column          | Type    | Options     |
|-----------------|---------|-------------|
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| year            | integer | null: false |
| month           | integer | null: false |
| date            | integer | null: false |

### Association
has_many :items
has_many :orders

## Itemsテーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item_name   | string     | null: false                    |
| explanation | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| burden      | string     | null: false                    |
| region      | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| item_user   | references | null: false, foreign_key: true |

### Association
has_one :order
belongs_to :user

## Ordersテーブル

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| order_user | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
belongs_to :item
has_one :address

## Addressesテーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
belongs_to :order
