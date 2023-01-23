# アプリケーション名
pick me

# アプリケーション概要
「暇つぶし」を目的としたチャットアプリ。<br>
暇のつぶし方を共有する暇な人と繋がることができる。<br>
暇をどのようにつぶしたいかを「hima」という投稿で発信したり、<br>他ユーザーの「hima」に反応することで、相手とトークすることができるようになる。<br>
トークを通して立てた予定や、雑談などで暇をつぶすことができる。

# URL
https://pickmeapp.onrender.com/<br>
ID：edwin<br>
PASS：1947

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

- この他ご自身でアカウントを作成しご利用いただいても構いません

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
2. 他ユーザーが投稿した「hima」の中で、気に入ったものを選ぶ
3. リクエストを送る(「スプラトゥーンにハマってるのでやりましょう！」、「〇〇の美味しい店知ってます。」等)と新規トークルームが作成される
<!-- フォロー機能もあるが、現状使ってない -->
4. リクエストが気に入られた場合、トークルームでメッセージを送れるようになる
5. 目的に沿って暇をつぶす

# アプリケーションを作成した背景
「急遽予定がなくなってしまった」「平日が忙しく、予定を立てられずに休日を迎えてしまった」などの理由で、<br>
意図せずとも暇な時間ができてしまうことは、多くの人が経験する。 <br> 
既存のポピュラーなSNSを用いて暇つぶしの相手を探す場合、<br>
どのアプリケーションを用いても微妙に使いづらい点があることに気づいた。*後述<br>
そこで、効率的に暇つぶし相手を見つけることに特化したアプリケーションを開発することにした。

##### 各種サービスにおいて暇つぶし相手を探す上で不便な点
- Twitter(ツイート)
  - ツイートを見てもらえないor見逃してしまう
  - リプライで意図しない相手から連絡が来てしまう

- Instagram(ストーリー)
  - ストーリーを見てもらえないor見逃してしまう
  - 素材を用意しなければならない(暇つぶし相手を探すのに特化していないため)

- LINEやDM(自分から声をかける場合)
  - 一人一人に送らなければならない
  - ダブルブッキングしてしまうことがある

- 出会い系サービス
  - 「出会う」ことが主な目的のため、それ以外の目的(メッセージで話したいだけ等)には向かない
  - 知り合ってから実際に会うまでの時間が長くなりがち


# 洗い出した要件
https://docs.google.com/spreadsheets/d/1Doi1Cv1n-u28gp4kk_gJvH-w7Ce61l-qspNHviu7PVc/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
- マイページを閲覧することができる
![マイページ閲覧](https://gyazo.com/db272dfbde173ccfbebb443e72c1a8bd/raw)

- マイページを編集することができる
![マイページ編集](https://gyazo.com/7f66ac35d79e2a61450662bf9f2e3f2c/raw)

- 他のユーザーのページを閲覧することができる
![他ユーザーページ閲覧](https://gyazo.com/5f075c918128b08746f56397d3914876/raw)

- ユーザーにメモを残すことができる
![メモ](https://gyazo.com/f545c2c03b1ccd96760608f03b17acb8/raw)

- 新規「hima」ページに遷移することができる
![新規「hima」遷移](https://gyazo.com/0e8e2c0be2598f786b8cec093c5a03a9/raw)

- 「hima」を投稿することができる
![「hima」投稿](https://gyazo.com/b36d8ef0af66c8fbca4f0b923d66263c/raw)

- 投稿された「hima」にリクエストを送ることができる
![リクエスト送信](https://gyazo.com/0f3ac42c47a0992da9fd61633b9b852e/raw)

- 自身の送ったリクエストを確認することができる
![リクエスト中確認](https://gyazo.com/e25ff625bf45e7646b5d4f67fd208fcc/raw)

- 相手からきたリクエストを確認することができる
![リクエスト一覧](https://gyazo.com/80b1749506c35c8e169120b28f3d97a8/raw)
　　
- トークルームを確認することができる
![個別トークルーム](https://gyazo.com/4b84b4e88a59d71a7c06d1803d32fb5a/raw)

- 相手からきたリクエストを受け取ることができる
![リクエスト承認](https://gyazo.com/da0ecbf64a0089e2f2751bf69fc8f244/raw)

- メッセージを送ることができる
![メッセージ送信](https://gyazo.com/891d4068cfaf86f31b45bc463755ce55/raw)

- トークルームをクローズすることができる
![ルームクローズ](https://gyazo.com/0020f86f7733aef817128fc5ddba11ac/raw)

# 実装予定の機能
- テストの実施
- Bootstrapを用いたレイアウト・UIの向上
- 自身のhimaの削除機能
- 自身のhimaの公開範囲指定機能
- フォロー機能(relationships テーブルの処理)の充実
- himaのソート機能
- 既存の知り合いの追加機能
- コンスタントルーム(クローズ不可のトークルーム)でのトーク機能
- リクエストのテンプレート登録・装填機能

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
- add_index :relationships, [:subject_id, :object_id], unique: true

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
- add_index :hit_ons, [:user_id, :hima_id], unique: true

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
![画面遷移図](https://gyazo.com/f86ead538299fb09d0b103d3e6f21c81/raw)

# 開発環境
- フレームワーク
  - Ruby on Rails
- タスク管理
  - GitHub
- テキストエディタ
  - Visual Studio Code
- 使用言語
  - HTML
  - CSS
  - JavaScript
  - Ruby
- デプロイ
  - Render
  - PostgreSQL
  - AWS/S3

# ローカルでの動作方法
以下のコマンドを順に実行
```
git clone https://github.com/38752/pick_me_app
```
```
cd pick_me_app
```
```
bundle install
```
```
yarn install
```

# 工夫したポイント、苦労した点
#### hima新規投稿機能の実装
himaにつけることのできる「タグ」は、項目が決まっている(項目自体をユーザーが変更することができない仕様となっている)ことから、ActiveHashを用いて定義し、himaを保存するためのhimasテーブルとhimaとタグの紐づきを保存するためのhima_purposesの2つのテーブルを用いてhimaに関する情報を管理している。そのため、投稿フォームはフォームオブジェクトを用いて実装した。<br><br>
一方で、今後タグの項目に変更を加える可能性があることを踏まえると、保守性の観点からActiveHashの内容(項目の数やidの値等)に依らず機能するような処理を記述する必要があった。しかし、フォームオブジェクトでの処理の関係上、params直下の要素のキー名(ここではActiveHashのidの値)が固定されていない場合、タグ情報を格納している各要素を指定する方法がなく、フォームオブジェクトでキー名が固定されていない要素を扱えるようにparamsの構造を工夫する必要があった。<br><br>
この時、フォームの構造(name属性)自体をいじると、himaで設定したバリデーションを通過しなかった際の画面表示が意図しないものになってしまうため、コードの可読性を担保した上で条件を満たす処理を記述することに苦労した。

<!-- これでコメントアウト -->
