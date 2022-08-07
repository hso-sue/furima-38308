# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| name-kana          | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :purchase-records

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item-name      | string     | null: false                    |
| introduction   | text       | null: false                    |
| item-category  | string     | null: false                    |
| item-condition | string     | null: false                    |
| postage-payer  | string     | null: false                    |
| sender-area    | string     | null: false                    |
| preparation    | string     | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase-record


## purchase-records テーブル(購入記録)

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship_info

## ship-infos テーブル(発送先情報)

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post-card        | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building-name    | string     |                                |
| telephone-number | integer    | null: false                    |
| purchase-record  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record