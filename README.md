# アプリケーション名
Entry Exit

# アプリケーションの概要
点在する各現場の入退場履歴を確認することで、現場打合せの出戻り回避や、クレーム対応の時間短縮に繋がる

# URL
https://entryexit.onrender.com

# テスト用アカウント
・BASIC認証ID：admin  
・BASIC認証パスワード：2222  
・メールアドレス：test@test  
・パスワード：112233  

# 利用方法
## 物件登録
1.トップページ（物件一覧ページ）右上のメニューボタンから「物件登録」を選択  
2.新規物件登録ページから「施主名」「現場管理者」「建設地」を選択後、登録ボタンを押して物件登録  

## 入退場機能
1.トップページ（物件一覧ページ）から該当物件をクリック  
2.物件詳細ページへ遷移後「あなたの現在の状況」の下に表示されている「入場する」ボタンをクリックし物件へ入場する。  
3.あなたの現在の状況が「入場中（緑色で表示）」に変わる  
4.入退場ボタンの下に「現在の入場者」に自分の名前が表示される。  
5.作業終了後「退場する」ボタンをクリックする。  
6.あなたの現在の状況が「退場中（赤色で表示）」に変わる  
7.「現在の入場者」から自分の名前が削除される。

# アプリケーションを作成した背景
様々な場所に点在する建築現場で働く職方が  
「誰が」「いつ」「どこで」  
作業をしているか把握仕切れない問題があり  

・関係者が現場へ行っても職方が不在で出戻りになってしまう。  
・近隣クレームの対応に時間がかかる。　等  

事前に誰が現場に入っているかが分かれば関係者が余計な時間を取られず自分の時間を増やすことができると考えたため。

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
・入退場の表示が非同期通信で切り替わる機能を実装中。  
・入退場の記録が日々蓄積され職人1人1人の能力値の算出ができるような機能を今後実装予定  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/5a5233cbf5070d9368c9892e1450c933.png)](https://gyazo.com/5a5233cbf5070d9368c9892e1450c933)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/4157f6d91c816854906249ff7a970f67.png)](https://gyazo.com/4157f6d91c816854906249ff7a970f67)

# 開発環境
・HTML  
・CSS  
・Ruby  
・VS Code  
・GitHub  
・Render（デプロイ）

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/keita-s-1129/entryexit  
% cd entryexit  
% bundle install  
% rails db:create  
% rails db:migrate  

# 工夫したポイント
・高齢の職方でも扱い易いようフォントサイズやデザインを大きめに作成し、複雑な機能は省き視覚的にわかり易いデザインにした事  
・ユーザー自身が「建設地」「現場管理者」「職種」を登録、削除できるようActiveHashは使わず、それぞれテーブルを作成した事  
・物件の詳細ページより現在の入場者がリアルタイムで確認できるようにした事（未ログインユーザーでも確認可）  

# 改善点
・入退場の表示切替えを「非同期通信」にて実装することで、ユーザーのストレスを緩和させる（現在実装途中）  

# 制作時間
10日間（1日平均5時間作業）

# テーブル設計 - EntryExitのER図 -

## Users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |
| work_id            | integer  | null: false               |

### Association
- has_many   :homes
- has_many   :user_homes
- belongs_to :work


## Homes テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| user             | references | null: false, foreign_key: true  |
| title            | string     | null: false                     |
| address_id       | integer    | null: false                     |
| supervisor_id    | integer    | null: false                     |

### Association
- belongs_to :user
- belongs_to :address
- belongs_to :supervisor

## UserHomes テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user_id         | references | null: false, foreign_key: true  |
| home_id         | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :home


## Works テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| work            | string     |                                 |

### Association
- has_many :users


## Addresses テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| address         | string     |                                 |

### Association
- has_many :homes


## Supervisors テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| supervisor      | string     |                                 |

### Association
- has_many :homes


