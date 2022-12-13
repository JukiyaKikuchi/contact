# アプリケーション名
CONTACT

# アプリケーションの概要
保育園・幼稚園において家庭と園とのやりとりに使用する連絡帳をアプリケーション化し、先生の業務効率向上と家庭の手間削減が図れる。

# URL
https://contact-38182.onrender.com

# テスト用アカウント
・Basic認証パスワード admin
・Basic認証ID 2222

# 管理者用アカウント
・メールアドレス kanri@tesuto
・パスワード q1q1q1

# 利用方法
## 園からの「全体のお知らせ」投稿
1.管理者アカウントでログイン時、トップ画面のヘッダー部「投稿する」ボタンから投稿
2.投稿完了後、トップ画面に一覧で表示(ログインユーザのみ閲覧可能)

## 家庭用連絡帳投稿
1.親アカウントでログイン後、一覧画面内の自身の子どもの写真をクリック後、連絡帳の提出状況一覧画面へ遷移
2.「新規投稿」ボタンをクリックし、新規投稿画面にて投稿
3.投稿後の連絡帳を編集削除したい場合は該当する連絡帳をクリックし、詳細画面遷移すると投稿したユーザーのみが編集削除可能

## 先生からのコメント投稿
1.管理者でログイン後、一覧画面からその日の連絡帳をクリックし、詳細画面へ遷移
2.詳細画面下部の先生コメント欄から投稿可能

# アプリケーションを開発した背景
連絡帳という事務作業をアプリ化することにより、先生と親相互の業務工率化を図るため。

# 洗い出した要件

# 実装した機能についての画像やGIF及びその説明

# 実装予定の機能
クラス機能を設け、クラスごとの連絡帳機能作成。
また、クラスからのお知らせ機能を設け、クラスでの出来事がわかるようにする。
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

### Association
- has_many   : class_informations
- has_many   : parent_books
- has_many   : teacher_comments
- has_many   : registers
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
| user            | references | null: false, foreign_key: true       |


### Association
- belongs_to   : user
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
・フロントエンド
・バックエンド
・テスト
・テキストエディタ
・タスク管理

# ローカルでの動作方法
以下のコマンドを順に実施。
％ git clone https://github.com/JukiyaKikuchi/contact.git
% cd contact
% bundle install
% yarn install

# 工夫したポイント
管理者モードでは一覧画面において各園児のその日の登園状況だけでなく、重要な情報がパッと見でわかるようにした。
また親モードでは自分の子のみ表示されるようにすることでプライバシー保護に努めた。
