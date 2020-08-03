# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password-confirmation | string | null: false |
| family-name           | string | null: false |
| last-name             | string | null: false |
| family-name-furigana  | string | null: false |
| last-name-furigana    | string | null: false |



### Association

- has_many :items
- has_many :comments
- has_one :profile

## profiles テーブル

| Column            | Type       | Options |
| ----------------- | ---------- | ------- |
| phon-number       | integer    |         |
| address           | string     |         |
| self-introduction | string     |         |
| user              | references |         |

### Association

- belongs_to :user

## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| image       | text       | null: false |
| name        | string     | null: false |
| explanation | string     | null: false |
| price       | integer    | null: false |
| user        | references |             |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column | Type       | Options     |
| ------ | ---------- | ------------|
| text   | string     | null: false |
| user   | references |             |
| item   | references |             |

### Association

- belongs_to :user
- belongs_to :item


