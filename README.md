## users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| company_name       | string |                           |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |

### Association

- has_many :products
- has_many :comments

## products

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| status_id   | integer    | null: false                    |
| explanation | text       | null: false                    |
| price       | integer    |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- belongs_to_active_hash :status

## comments

| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| product | references | null: false, unique: true, foreign_key: true |
| user    | references | null: false, unique: true, foreign_key: true |
| content | text       | null: false                                  |

### Association

- belongs_to :user
- belongs_to :product

## favorites

| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| product | references | null: false, unique: true, foreign_key: true |
| user    | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
