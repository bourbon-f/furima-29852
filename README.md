# README

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first-name       | string | null: false |
| family-name      | string | null: false |
| first-name-kana  | string | null: false |
| family-name-kana | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| product_name| string      | null: false                    |
| description | text        | null: false                    |
| category    | integer     | null: false                    |
| status      | integer     | null: false                    |
| burden      | integer     | null: false                    |
| area        | integer     | null: false                    |
| days        | integer     | null: false                    |
| price       | integer     | null: false                    |
| user        | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy

## buy テーブル

| Column      | Type        | Options                       |
| ----------- | ----------- | ----------------------------- |
| user        | references  | null: false foreign_key: true |
| items       | references  | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :add

## add テーブル
| Column       | Type        | Options                       |
| ------------ | ----------- | ----------------------------- |
| number       | string      | null: false                   |
| deadline     | string      | null: false                   |
| code         | string      | null: false                   |
| postal-code  | string      | null: false                   |
| prefectures  | integer     | null: false                   |
| municipality | string      | null: false                   |
| address      | string      | null: false                   |
| tel-number   | string      | null: false                   |

### Association

- belongs_to :buy