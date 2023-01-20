# アプリケーション名
pick me

# アプリケーション概要
「暇つぶし」を目的としたSNS。暇をどのようにつぶしたいかを発信、または他ユーザーのそうした発信に反応することで、暇のつぶし方を共有する暇な人と繋がることができる。

# URL
https://pickmeapp.onrender.com/

# テスト用アカウント
## 閲覧用アカウント(データの作成・編集不可)
- 新規投稿したアカウント
  - e-mail：hima@test.com
  - pass：111iii
  
- 投稿に反応したアカウント
  - e-mail：request@test.com
  - pass：111iii
  
- 投稿に反応し、トークできる状態のアカウント
  - e-mail：talk@test.com
  - pass：111iii

## 挙動確認用アカウント(データの作成・編集可 ※閲覧用アカウントのhimaに対してはリクエストしないでください)
- 挙動確認用①
  - e-mail：test1@test.com
  - pass：111iii
  
- 挙動確認用②
  - e-mail：test2@test.com
  - pass：111iii

- この他ご自身で作成したアカウントをご利用いただいても構いません

# 利用方法
#### 「hima」を投稿するユーザー視点
1. 新規登録を行う
2. 暇な時、どのように暇なのかを記載し「hima」を投稿する(「1時間だけオンラインでゲームをしたい」、「これから〇〇で夕飯を食べたい」等)
3. 他のユーザーから来たリクエストの中から気に入ったものを承認すると、メッセージを送れるようになる
<!-- フォロー機能もあるが、現状使ってない -->
4. 目的に沿って暇をつぶす
5. 任意でトークルームをクローズ(再びメッセージを送れない状態にすること)できる

#### 他ユーザーの「hima」に反応するユーザー視点
1. 新規登録を行う
2. 他ユーザーが投稿した「hima」の中で、気に入っものを選ぶ
3. リクエストを送る(「スプラトゥーンハマってるのでやりましょう！」、「〇〇の美味しい店知ってます。」等)と新規トークルームが作成される
<!-- フォロー機能もあるが、現状使ってない -->
4. リクエストが気に入られた場合、トークルームでメッセージを送れるようになる
5. 目的に沿って暇をつぶす

# アプリケーションを作成した背景
「急遽予定がなくなってしまった」「平日が忙しく、予定を立てられずに休日を迎えてしまった」などの理由で、意図せずとも暇な時間ができてしまうことは、多くの人が経験する。
暇つぶしは一人でもできるが、既存のポピュラーなSNSを用いて暇つぶしの相手を探す場合、どのアプリケーションを用いても微妙に使いづらい点があることに気づいた。
そこで、効率的に暇つぶし相手を見つけることのできるアプリケーションを開発することにした。

<!-- 
使いづらい点まとめ
- Twitter(ツイート)
  - ツイートを見てもらえないor見逃してしまう
  - リプライで「お前じゃない」相手からリクエストが来ると気まずい

- Instagram(ストーリー)
  - ストーリーを見てもらえないor見逃してしまう
  - 素材を用意しなければならない(暇つぶし相手を探すのに特化していないため)

- LINEやDM(自分から声をかける場合)
  - 一人一人に送らなければならない
  - ダブルブッキングしてしまうことがある

- 出会い系
  - 「出会う」ことが主な目的のため、それ以外の目的(メッセージで話したいだけ等)には向かない
  - 知り合ってから実際に会うまでの時間が長くなりがち
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
 - has_many :messages, dependent: :destroy

## templates テーブル
※未実装

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
 - has_many :messages, dependent: :destroy

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
| content       | text       | null: false                    |

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
