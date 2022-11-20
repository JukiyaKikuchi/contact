# テーブル設計

## usersテーブル

| Column             | Type   | Options                    |
|--------------------|--------|----------------------------|
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           | date   | null: false                |

## Association
- has_many   : class_informations
- has_many   : general_informations
- has_many   : parent_books
- has_many   : teacher_books
- belongs_to : register
----------------------------------------------------------------------

## class_informationsテーブル

| Column               | Type        | Options                            |
|----------------------|-------------|------------------------------------|
| class_comment        | text        | null: false                        |
| user                 | references  | null: false, foreign_key: true     |
| register             | references  | null: false, foreign_key: true     |

## Association
- belongs_to : register
- belongs_to : user
-------------------------------------------------------------------------

## general_informationsテーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| title                | string      | null: false                    |
| general_comment      | text        | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| register             | references  | null: false, foreign_key: true |


## Association
- belongs_to : register
- belongs_to : user
-------------------------------------------------------------------------

## parent_booksテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| parent_name     | string     | null: false                    |
| parent_comment  | text       | null: false                    |
| temperature     | string     |                                |
| poop            | string     |                                |
| breakfast       | string     |                                |    
| dinner          | string     |                                |  
| attendance      | string     | null: false                    |
| greeted_time    | string     |                                |
| greeted_name    | string     |                                |
| tell_number     | string     |                                |
| user            | references | null: false, foreign_key: true |
| register        | references | null: false, foreign_key: true |


## Association
- belongs_to : register
- belongs_to : user
----------------------------------------------------------------------------

## teacher_booksテーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| teacher_name    | string     | null: false                    |
| teacher_comment | text       | null: false                    |
| lunch           | string     | null: false                    |
| sleep_time      | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| register        | references | null: false, foreign_key: true |


## Association
- belongs_to : register
- belongs_to : user
-----------------------------------------------------------------------------

## registersテーブル

## Association
- has_many   : class_informations
- has_many   : general_informations
- has_many   : parent_books
- has_many   : teacher_books
- has_many   : users
----------------------------------------------------------------------------