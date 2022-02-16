# アプリケーション名

TAKEOUT APP

# アプリケーション概要

このアプリケーションはテイクアウト専用のアプリケーションです。事前注文と事前決済を同時に行うことができます。
飲食店とユーザーがそれぞれ会員登録を行い、飲食店はメニューの投稿ができます。ユーザーは投稿されているメニューを選び、注文と決済をすることができます。

# URL

https://takeoutapp-37360.herokuapp.com/

# テスト用アカウント

- Basic認証パスワード : ma2636
- Basic認証ID : username

# 利用方法

## テイクアウト注文
1.トップページの「テイクアウトをご利用の方はこちらから」より、ユーザー新規登録を行います  
2.飲食店のページをクリックし、飲食店のマイページに遷移します  
3.注文したいメニューを選び、注文するというボタンをクリックします  
4.メニューを選択し、次へボタンをクリックします  
5.受け取り時間の入力と、クレジットカード情報を入力し、注文決定というボタンをクリックします  
6.注文確定のページに遷移し、オーダー番号が発行されます  
  
  
# アプリケーションを作成した背景

コロナ禍で家に居る時間が多い中、テイクアウトを利用してお店の味を楽しみたいと思うことが増えました。  
しかし、「利用はしたいが、テイクアウトのメニューがわからないことと、電話予約時にメニューと金額を聞きながら注文し、さらに現地決済となると非常に手間がかかる」という課題がありました。  
そこで、Webページにメニュー情報の記載があり、その場で注文と決済までを行うことができるようになれば、前述の手間が削減できるのではと考え、テイクアウトに特化したWebアプリケーションを開発することにいたしました。

# 洗い出した要件

[要件を定義したシート](https://docs.google.com/spreadsheets/d/14zTJDloLGlPCN9W_hA7bIlXY0omAEyi8hdnsbLrplDk/edit?usp=sharing)

# 実装予定の機能

購入機能、検索機能、フォロー管理機能

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/22a0085be57ab6e4560322cc2738dcb8.png)](https://gyazo.com/22a0085be57ab6e4560322cc2738dcb8)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/6e4ce776ba124e136669cb3f572f8ee4.png)](https://gyazo.com/6e4ce776ba124e136669cb3f572f8ee4)

# 開発環境

- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ

<!-- # ローカルでの動作方法 -->
<!-- # 工夫したポイント -->


# Table

## Shopsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| name                | string     | null: false                    |
| name_kana           | string     | null: false                    |
| text                | text       | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     | null: false                    |
| tel                 | string     | null: false                    |
| holiday             | string     | null: false                    |
| opentime_at         | datetime   | null: false                    |
| closetime_at        | datetime   | null: false                    |
<<<<<<< Updated upstream
| parking             | string     | null: false                    |
=======
| parking_id          | integer    | null: false                    |
| parking_explain     | string     |                                |
>>>>>>> Stashed changes
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
| last_name_kana     | string | null: false                 |
| first_name_kana    | string | null: false                 |
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
| takeout_at   | datetime   | null: false                    |
| item_user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item_user