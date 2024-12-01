# README

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
- has_many :homes
- has_many :favorites


## Homes テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| user             | references | null: false, foreign_key: true  |
| title            | string     | null: false                     |
| address_id       | integer    | null: false                     |
| supervisor_id    | integer    | null: false                     |

### Association
- belongs_to :user


## Favorites テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| user            | references | null: false, foreign_key: true  |
| home            | references | null: false, foreign_key: true  |

### Association
- has_many :users
- has_many :homes


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


