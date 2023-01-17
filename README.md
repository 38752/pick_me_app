# アプリケーション名
pick me

# アプリケーション概要
「暇つぶし」を目的としたSNS。暇をどのようにつぶしたいかを発信、または他ユーザーのそうした発信に反応することで、暇のつぶし方を共有する暇な人と繋がることができる。

# URL

# テスト用アカウント

# 利用方法
#### 「hima」を投稿するユーザー視点
1. 新規登録を行う
2. 暇な時、どのように暇なのかを記載し「hima」を投稿する(「1時間だけオンラインでゲームをしたい」、「これから吉祥寺で夕飯を食べたい」等)
3. 他のユーザーから来た「つぶす」リクエストが気に入った場合、ユーザーをフォローし、メッセージを送る
4. 目的に沿って暇をつぶす

#### 他ユーザーの「hima」に反応するユーザー視点
1. 新規登録を行う
2. 他ユーザーが投稿した「hima」の中で、気に入った過ごし方を選ぶ
3. 当該のユーザーをフォローし、「つぶす」リクエストを送る(「スプラトゥーンハマってるのでやりましょう！」、「吉祥寺の美味しい店知ってます。」等)
4. リクエストが気に入られた場合、メッセージを送れるようになる
5. 目的に沿って暇をつぶす

# アプリケーションを作成した背景
- 急遽予定がなくなってしまった
- 平日が忙しく、予定を立てられずに休日を迎えてしまった  
などの理由で、誰かと一緒に暇をつぶしたくなることは、多くの人が経験したことがある。既存のポピュラーなSNSを用いて人を探す場合、どのアプリケーションを用いても微妙に使いづらい点があることに気づいた。
そこで、効率的に暇つぶし相手を見つけることのできるアプリケーションを開発することにした。

<!-- 
使いづらい点まとめ
###### Twitter(ツイート)
- リプライで「お前じゃない」相手からリクエストが来ると気まずい
- 他のツイートに流され見逃されてしまう

###### Instagram(ストーリー)
- 他のストーリーに流され見逃されてしまう
- 素材を用意しなければならない(暇つぶし相手を探すのに特化していないため)

###### LINEやDM(自分から声をかける場合)
- 一人一人に送らなければならない
- ダブルブッキングしてしまうことがある

###### 出会い系
- 「出会う」ことが主な目的のため、それ以外の目的(メッセージで話したいだけ等)には向かない

 -->

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1Doi1Cv1n-u28gp4kk_gJvH-w7Ce61l-qspNHviu7PVc/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計

## users テーブル

| Column             | Type    | Options                    |
| ------------------ | ------- | -------------------------- |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false                |
| nickname           | string  | null: false                |
| how_old_id         | integer | null: false                |
| sex_id             | integer | null: false                |
| introduction       | text    |                            |
| status_id          | integer | null: false, default: 1000 |

### Association
 - has_many :templates
 - has_many :memos,         class_name: "Memo", foreign_key: "subject_id", dependent: :destroy
 - has_many :reverse_memos, class_name: "Memo", foreign_key: "object_id",  dependent: :destroy
 - has_many :relationships, class_name: "Relationship", foreign_key: "subject_id", dependent: :destroy
 - has_many :objects, through: :relationships, source: :object
 - has_many :reverse_relationships, class_name: "Relationship", foreign_key: "object_id", dependent: :destroy
 - has_many :subjects, through: :reverse_relationships, source: :subjects
 - has_many :himas
 - has_many :hit_ons
 - has_many :rooms, class_name: "Room", foreign_key: "room_master_id", dependent: :destroy
 - has_many :room_users, dependent: :destroy
 - has_many :rooms, through: :room_users, dependent: :destroy
 - has_many :messages

## templates テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| priority   | integer    | null: false                    |
| how_old_id | integer    | null: false                    |
| sex_id     | integer    | null: false                    |
| line       | text       | null: false                    |

### Association
 - belongs_to :user

## memos テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| subject_id | integer | null: false, foreign_key: true |
| object_id  | integer | null: false, foreign_key: true |
| memo       | text    | null: false                    |

### Association
 - belongs_to :user

## relationships テーブル

| Column                | Type    | Options                        |
| --------------------- | ------- | ------------------------------ |
| subject_id            | integer | null: false, foreign_key: true |
| object_id             | integer | null: false, foreign_key: true |
| relationship_index_id | integer | null: false, default: 1000     |
add_index :relationships, [:subject_id, :object_id], unique: true

### Association
 - belongs_to :user

## himas テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| title         | string     | null: false                    |
| location      | string     |                                |
| text          | text       | null: false                    |
| open_range_id | integer    | null: false                    |

### Association
 - belongs_to :user
 - has_many :hima_purposes
 - has_many :hit_ons

## hima_purposes テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| hima          | references | null: false, foreign_key: true |
| purpose_id    | integer    | null: false                    |

### Association
 - belongs_to :hima
 - belongs_to :purpose

## hit_ons テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| hima          | references | null: false, foreign_key: true |
| line          | text       | null: false                    |
add_index :hit_ons, [:user_id, :hima_id], unique: true

### Association
 - belongs_to :user
 - belongs_to :hima
 - has_one :room, dependent: :destroy

## rooms テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| hit_on               | references | null: false, foreign_key: true |
| room_master_id       | integer    | null: false, foreign_key: true |
| room_status_index_id | integer    | null: false, default: 10       |

### Association
 - belongs_to :hit_on
 - belongs_to :room_master, class_name: "User"
 - has_many :room_users, dependent: :destroy
 - has_many :users, through: :room_users
 - belongs_to :room_status_index
紐
## room_users テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| room          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
 - belongs_to :room
 - belongs_to :user

## messages テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| room          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| message       | text       | null: false                    |

### Association
 - belongs_to :room
 - belongs_to :user


# 画面遷移図

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法

# 工夫したポイント
