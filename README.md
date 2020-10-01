# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| name-kana| string | null: false |
| birthday | string | null: false |

### Association

- has_many :listing
- has_many :buy

## listing テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| image       | references  | null: false, foreign_key: true |
| product_name| string      | null: false                    |
| description | string      | null: false                    |
| category    | string      | null: false                    |
| status      | string      | null: false                    |
| burden      | string      | null: false                    |
| area        | string      | null: false                    |
| days        | string      | null: false                    |
| price       | string      | null: false                    |
| user_id     | references  | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buy

## buy テーブル

| Column      | Type        | Options                       |
| ----------- | ----------- | ----------------------------- |
| number      | string      | null: false                   |
| deadline    | string      | null: false                   |
| code        | string      | null: false                   |
| postal-code | string      | null: false                   |
| prefectures | string      | null: false                   |
| municipality| string      | null: false                   |
| address     | string      | null: false                   |
| tel-number  | string      | null: false                   |
| user_id     | references  | null: false foreign_key: true |
| listing_id  | references  | null: false foreign_key: true |

### Association

- belongs_to :users
- belongs_to :listing
