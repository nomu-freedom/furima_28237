# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password-confirmation | string  | null: false |
| family-name           | string  | null: false |
| last-name             | string  | null: false |
| f-name-furigana       | string  | null: false |
| l-name-furigana       | string  | null: false |
| birthday              | date    | null: false |


### Association

- has_many :items
- has_many :comments
- has_one :profile

## profiles テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| phon-number       | integer    |                   |
| address           | string     |                   |
| self-introduction | text       |                   |
| user              | references | foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| image           | text       | null: false       |
| name            | string     | null: false       |
| explanation     | text       | null: false       |
| category        | string     | null: false       |
| status          | string     | null: false       |
| delivery-fee    | string     | null: false       |
| shipping-origin | string     | null: false       |
| until-shipping  | integer    | null: false       | 
| price           | integer    | null: false       |
| user            | references | foreign_key: true |

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

## purchases テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| price          | integer    | null: false       |
| postal-ocode   | integer    | null: false       |
| prefectures    | string     | null: false       |
| city           | string     | null: false       |
| address        | string     | null: false       |
| building-name  | string     |                   |
| phone-number   | integer    | null: false       |
| user           | references | foreign_key: ture |
| item           | references | foreign_key: ture |

### Association

- belongs_to :user
- belongs_to :item


