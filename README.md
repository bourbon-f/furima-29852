# README

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| product_name| string      | null: false                    |
| description | text        | null: false                    |
| category_id | integer     | null: false                    |
| status_id   | integer     | null: false                    |
| burden_id   | integer     | null: false                    |
| area_id     | integer     | null: false                    |
| days_id     | integer     | null: false                    |
| price       | integer     | null: false                    |
| user        | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column      | Type        | Options                       |
| ----------- | ----------- | ----------------------------- |
| user        | references  | null: false foreign_key: true |
| items       | references  | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル
| Column        | Type        | Options                       |
| ------------- | ----------- | ----------------------------- |
| postal_code   | string      | null: false                   |
| prefectures   | integer     | null: false                   |
| municipality  | string      | null: false                   |
| address       | string      | null: false                   |
| building_name | string      |                               |
| tel_number    | string      | null: false                   |
| buy           | references  | null: false foreign_key: true |

### Association

- belongs_to :buy