# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| name              | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :profile

## profiles テーブル

| Column            | Type      | Options |
| ----------------- | --------- | ------- |
| phon-number       | integer   |         |
| address           | string    |         |
| self-introduction | string    |         |
| user              | reference |         |

### Association

- belongs_to :user

## items テーブル

| Column  | Type      | Options     |
| ------- | --------- | ------------|
| name    | string    | null: false |
| price   | integer   | null: false |
| status  | string    | null: false |
| content | string    | null: false |
| user    | reference |             |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column | Type      | Options     |
| ------ | --------- | ------------|
| text   | string    | null: false |
| user   | reference |             |
| item   | reference |             |

### Association

- belongs_to :user
- belongs_to :item


