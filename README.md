# Table

## Shopsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| text                | text       | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| tel                 | string     | null: false                    |
| holiday_id          | integer    | null: false                    |
| opentime_at         | datetime   | null: false                    |
| closetime_at        | datetime   | null: false                    |
| parking_id          | integer    | null: false                    |
| parking_explain     | string     | null: false                    |
| genre_id            | integer    | null: false                    |
| item                | references | null: false, foreign_key: true |

### Association

- has_many :items

## Usersテーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | --------------------------- |
| nickname           | string | null: false                 |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |
| last_name          | string | null: false                 |
| first_name         | string | null: false                 |
| tel                | string | null: false                 |

### Association

- has_many :item_users
- has_many :items, through: :item_users

## Itemsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| text     | text       | null: false                    |
| price    | integer    | null: false                    |
| genre_id | integer    | null: false                    |
| shop     | references | null: false, foreign_key: true |

### Association

- has_many :item_users
- has_many :users, through: :item_users

## Item_userテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :reserve

## Reserveテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| takeout_date | date       | null: false                    |
| takeout_at   | dateime    | null: false                    |
| item_user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item_user