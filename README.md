# アプリケーション名
CONTACT

# アプリケーションの概要
保育園や幼稚園において家庭と園とのやりとりに使用する連絡帳をアプリケーション化し、先生の業務効率化と家庭の手間削減が図れる。

# URL
 https://contact-38182.herokuapp.com/

# ID/Pass
・Basic認証ID admin  
・Basic認証パスワード 2222
# テスト用アカウント
## 管理者用アカウント
・メールアドレス kanri@tesuto  
・パスワード a1a1a1

## 親用アカウント　
・メールアドレス test@example  
・パスワード e1e1e1

# 利用方法
## 園からの「全体のお知らせ」投稿
1.管理者アカウントでログイン後にトップ画面のヘッダー部「投稿する」ボタンから投稿  
2.投稿完了後、トップ画面に一覧で表示される(ログインユーザのみ閲覧可能)

## 連絡帳投稿
1.親用アカウントでログインし、一覧画面内の自身の子どもの写真をクリック後、連絡帳の提出状況一覧画面へ遷移  
2.「新規投稿」ボタンをクリックし、新規投稿画面にて投稿  
3.投稿後の連絡帳を編集削除したい場合は連絡帳一覧画面内の該当する連絡帳をクリックし、詳細画面遷移後、編集削除可能

## 先生からのコメント投稿
1.管理者でログイン後、一覧画面から任意の連絡帳をクリックし、詳細画面へ遷移  
2.詳細画面下部の先生コメント欄から投稿可能
3.親は連絡帳の詳細画面より確認が可能

# アプリケーションを作成した背景
連絡帳という事務作業をアプリ化することにより、先生と親相互の業務工率化を図るため。  
私の娘が通う保育園では連絡帳がノートである。1クラス約30名の園児がいる中、3~4名の先生が子どもたちの対応をするとなるとリソースが足りないと感じる。また、親の視点から見ても「ノート」という媒体は家に忘れてしまったり、記入忘れをするといった課題や、お休みの連絡をわざわざ先生・親双方が忙しい朝の時間帯にするのは、あまりにも非効率であると感じた。  
これらの課題を解決すべく、「時間・場所にとらわれずに確認や記入ができる」、「パッと見て登園状況や園児のコンディションがわかる」ことを実現させリソース不足に悩む保育業界、時間の効率化を図りたい親を助けられるような連絡帳アプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1OuCeu09lNVFvG1faWi3JME813lcyZuwGgx0SYyd_FP8/edit#gid=982722306

# 実装した機能についての画像やGIF及びその説明
(今後、掲載します)

# 実装予定の機能
クラス機能を設け、クラスごとの連絡帳機能作成。
また、クラスからのお知らせ機能を設け、クラスでの出来事がわかるようにする。
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/2e12d09a7aec19eb32a256d953d6e9be.png)](https://gyazo.com/2e12d09a7aec19eb32a256d953d6e9be)

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
- has_many   : parent_books
- has_many   : teacher_comments
- has_many   : registers
----------------------------------------------------------------------

## registersテーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| title                | string      | null: false                    |
| general_comment      | text        | null: false                    |
| user                 | references | null: false, foreign_key: true  |


### Association
- belongs_to   : user
- has_many     : parent_books
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
## 管理者用  
[![Image from Gyazo](https://i.gyazo.com/5095e0615192b751e0215d7d22686c65.png)](https://gyazo.com/5095e0615192b751e0215d7d22686c65)  
## 親用  
[![Image from Gyazo](https://i.gyazo.com/11b3c453f24b81cac264b31f7080bf35.png)](https://gyazo.com/11b3c453f24b81cac264b31f7080bf35)  


# 開発環境
・フロントエンド  
・バックエンド  
・テスト  
・テキストエディタ  
・タスク管理  
・画像保存先S3

# ローカルでの動作方法
以下のコマンドを順に実施。  
％ git clone https://github.com/JukiyaKikuchi/contact.git  
% cd contact  
% bundle install  
% yarn install

# 工夫したポイント
管理者モードでは一覧画面において各園児のその日の登園状況だけでなく、重要な情報がパッと見でわかるようにした。  
また親モードでは自分の子のみ表示されるようにすることでプライバシー保護に努めた。
