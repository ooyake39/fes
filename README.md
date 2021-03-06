# アプリケーション名
## FES(Fledgling engineer support)

## アプリケーション概要
#### これからエンジニアやプログラミングを学ぼうと思っている人達の、マインド面（不安・悩み）を相談でき、エンジニア経験者からリアルな声を聞く事ができるような、Q&Aサイトを制作いたしました。

## 制作背景
#### 実際、私自身がマインド面で相談したいという場面に直面したからです。TCでは入校前に事前カウンセリングというサービスを行っていた為、マインド面の相談をすることができましたが、これからエンジニアを目指す人がカウンセリングという環境なしで、簡易的に不安や悩みを相談出来る環境を課題化し、解決策としてこちらのサイトを制作いたしました。

## ペルソナ
#### 性別・年齢：20代〜40代半ばの男女

## デプロイURL
- #### [heroku](https://fes-a.herokuapp.com/)

## テスト用アカウント
- #### Email
- ##### 1.test2@gmail
- ##### 2.test3@gmail
- #### Pass
- ##### 1.testtest2
- ##### 2.testtest3


## 洗い出した要件
| 機能                | 目的    |
| -----------------  | ------  |
| ログイン機能         | 質問・回答とどのユーザーが投稿したのか判別するため|
| 質問機能            | 不安や悩みを相談できる様にするため|
| 回答機能            | 質問に対して解決に導いてくれるようにするため|
| 質問一覧表示機能     | 沢山のユーザーが質問した一覧を閲覧できる様にするため|
| 質問詳細機能         | 一覧ではユーザー目線を考え沢山の質問をみて欲しかったため、質問詳細ページから回答できるようにするため
| ユーザー詳細機能      | 一人のユーザーの悩みや不安の相談の数を一覧として閲覧できる様にしたいため |
| フロント実装機能    | formボタンなどをユーザー目線で考え、迷子にならない様にcss・jsなどを使い見た目を整えました |
| いいね機能         | 不安や悩みについて共感できる為|

# DEMO
## トップページです。
<a href="https://gyazo.com/9ed2db80a9b0b39a9a30bf3b390cee73"><img src="https://i.gyazo.com/9ed2db80a9b0b39a9a30bf3b390cee73.gif" alt="Image from Gyazo" width="1000"/></a>

## 新規登録画面・ログイン画面です。
#### フォームが空の場合だと保存できず、エラーメッセージが表示される様にしています。
<a href="https://gyazo.com/2c87d321e6b5d0cf8e4a685e3975b3c2"><img src="https://i.gyazo.com/2c87d321e6b5d0cf8e4a685e3975b3c2.gif" alt="Image from Gyazo" width="1000"/></a>

## 質問投稿画面です。
#### ログインしている事が前提です。フォームが空の場合だと保存できず、エラーメッセージが表示される様にしています。
<a href="https://gyazo.com/e8ad33cf91d83987ad9ad4a8f16cbd7b"><img src="https://i.gyazo.com/e8ad33cf91d83987ad9ad4a8f16cbd7b.gif" alt="Image from Gyazo" width="1000"/></a>

## 質問詳細ページ・回答一覧です。
#### ログインしていなくても表示する事ができます。質問一覧表示のQをクリック、もしくはプルダウンメニューから詳細をクリックすると、遷移します。
<a href="https://gyazo.com/f27bd875a280ddc4c7e608ae31b95742"><img src="https://i.gyazo.com/f27bd875a280ddc4c7e608ae31b95742.gif" alt="Image from Gyazo" width="1000"/></a>

## ユーザー詳細ページです。
#### 一人のユーザーがどれだけの不安や悩みを相談しているか確認する事ができます。質問・回答と両方見れる様にしています。
<a href="https://gyazo.com/dfbaeb8bc8b4a0534c06702c381008d4"><img src="https://i.gyazo.com/dfbaeb8bc8b4a0534c06702c381008d4.gif" alt="Image from Gyazo" width="1000"/></a>

## テーブル設計
##  usersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| name               | text   | null: false  |
| email              | string | null: false  |
| password           | string | null: false  |


###  Association
- has_many : questions
- has_many : answer

##  questionsテーブル

| Column             | Type       | Options      |
| ------------------ | ---------- | ------------ |
| title              | string     | null: false  |
| text               | text       | null: false  |
| user               | references | null: false, foreign_key: true    |

###  Association
- has_many :answer
- belongs_to : user

## answersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| text               | text   | null: false  |
| user               | references | null: false, foreign_key: true |
| question           | references | null: false, foreign_key: true |

###  Association
- belongs_to : question
- belongs_to : user

### likesテーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| user               | references | null: false, foreign_key: true |
| question           | references | null: false, foreign_key: true |

###  Association
- belongs_to : question
- belongs_to : user

### nicesテーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| user               | references | null: false, foreign_key: true |
| answer             | references | null: false, foreign_key: true |

###  Association
- belongs_to : answer
- belongs_to : user

## ER図
<a href="https://gyazo.com/276a187323fcba59363f401491f767c4"><img src="https://i.gyazo.com/276a187323fcba59363f401491f767c4.png" alt="Image from Gyazo" width="572"/></a>

## 画面遷移図
<a href="https://gyazo.com/ad441eb98b7557d3acda70f7d2b48248"><img src="https://i.gyazo.com/ad441eb98b7557d3acda70f7d2b48248.png" alt="Image from Gyazo" width="816"/></a>