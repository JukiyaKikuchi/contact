# アプリケーション名

CONTACT

# アプリケーションの概要

# URL

# テスト用アカウント

# 利用方法

# アプリケーションを開発した背景

# 洗い出した要件

# 実装した機能についての画像やGIF及びその説明
# 実装予定の機能
# データベース設計

# テーブル設計

## usersテーブル

| Column             | Type      | Options                      |
|--------------------|-----------|------------------------------|
| email              | string    | null: false, unique: true    |
| encrypted_password | string    | null: false                  |
| last_name          | string    | null: false                  |
| first_name         | string    | null: false                  |
| last_name_kana     | string    | null: false                  |
| first_name_kana    | string    | null: false                  |
| birthday           | date      | null: false                  |
| register           | references| null:false, foreign_key: true|

### Association
- has_many   : class_informations
- has_many   : parent_books
- has_many   : teacher_comments
- belongs_to : register
----------------------------------------------------------------------

## class_informationsテーブル

| Column               | Type        | Options                            |
|----------------------|-------------|------------------------------------|
| class_comment        | text        | null: false                        |
| user                 | references  | null: false, foreign_key: true     |

### Association
- belongs_to : user
-------------------------------------------------------------------------

## registersテーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| title                | string      | null: false                    |
| general_comment      | text        | null: false                    |


### Association
- has_many   : users
-------------------------------------------------------------------------

## parent_booksテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| parent_name     | string     | null: false                    |
| parent_comment  | text       | null: false                    |
| temperature     | string     |                                |
| mood_id         | integer    |                                |
| breakfast       | string     |                                |      
| attendance_id   | integer    | null: false                    |
| greeted_time_id | integer    |                                |
| greeted_name    | string     |                                |
| tell_number     | string     |                                |
| user            | references | null: false, foreign_key: true |
| register        | references | null: false, foreign_key: true |


### Association
- belongs_to : user
- belongs_to : register
- has_many   : teachers_comments
----------------------------------------------------------------------------

## teacher_commentsテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| teacher_name    | string     | null: false                    |
| teacher_comment | text       | null: false                    |
| user            | references | null: false, foreign_key: true |
| parent_book     | references | null: false, foreign_key: true |


### Association
- belongs_to : user
- belongs_to : parent_book

# 画面遷移図
# 開発環境
# ローカルでの動作方法
# 工夫したポイント工夫したポイント