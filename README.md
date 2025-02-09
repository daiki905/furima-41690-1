# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| first_name          | string              | null: false               |
| last_name           | string              | null: false               |
| first_name_katakana | string              | null: false               |
| first_name_katakana | string              | null: false               |
| nickname            | string              | null: false               |
| encrypted_password  | string              | null: false               |
| email               | string              | null: false unique: true  |
| date                | string              | null: false               |

### Association

* has_many :items
* has_many :buy-somes


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| item_money                          | numeric    | null: false                    |
| user                                | references | null: false, foreign_key: true |
| category                            | text       | null: false                    |
| item_manual                         | text       | null: false                    |
| item_status_id                      | integer    | null: false                    |
| payee_id                            | integer    | null: false                    |
| shippingsource_id                   | integer    | null: false                    |
| readtime_id                         | integer    | null: false                    |

### Association

- belongs_to :user
- belongs_to :buy-somes

## buy-somes table

| Column      | Type       | Options                         |
|-------------|------------|---------------------------------|
| user        | references | null: false, foreign_key: true  |
| items       | references | null: false, foreign_key: true  |


### Association

- has_one :deliveries
- belongs_to :user

## deriveries table

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| purchaser_postcode     | text       | null: false                    |
| buy_somes              | references | null: false, foreign_key: true |
| purchaser_adress       | text       | null: false,                   |
| card_number            | text       | null: false                    |
| buy_somes              | references | null: false, foreign_key: true |
| purchaser_adress       | numeric    | null: false,                   |
| card_expiry            | numeric    | null: false,                   |
| security_code          | numeric    | null: false,                   |
| adress_num             | numeric    | null: false,                   |
| prefecture_id          | integer    | null: false,                   |
| first_adress           | string     | null: false,                   |
| second_adress          | string     | null: false,                   |
| bulding_name           | string     | null: false,                   |
| tel_num                | numeric    | null: false,                   |


### Association

- belongs_to :buy-somes