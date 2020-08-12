# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| family_name           | string  | null: false |
| last_name             | string  | null: false |
| family_name_leading   | string  | null: false |
| last_name_leading     | string  | null: false |
| birthday              | date    | null: false |


### Association

- has_many :items
- has_many :comments

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| image              | text       | null: false       |
| name               | string     | null: false       |
| explanation        | text       | null: false       |
| category_id        | integer    | null: false       |
| status_id          | integer    | null: false       |
| delivery_fee_id    | integer    | null: false       |
| shipping_origin_id | integer    | null: false       |
| until_shipping_id  | integer    | null: false       | 
| price              | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_one :domicile

## comments テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | string     | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## sale テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| sold             | boolean    | null: false       |
| user             | references | foreign_key: ture |
| item             | references | foreign_key: ture |

### Association

- belongs_to :user
- belongs_to :item

## domiciles テーブル

| postal_code      | string     | null: false       |
| prefectures_id   | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | string     | null: false       |
| item             | references | foreign_key: ture |

### Association

- belongs_to :item
