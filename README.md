# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| introduction      | text       | null: false                    |
| item_category_id  | integer    | null: false                    |
| item_condition_id | integer    | null: false                    |
| postage_payer_id  | integer    | null: false                    |
| sender_area_id    | integer    | null: false                    |
| preparation_id    | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record


## purchase_records テーブル(購入記録)

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :ship_info

## ship_infos テーブル(発送先情報)

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| post_cord        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string    | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record