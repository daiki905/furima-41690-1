# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| first_name          | string              | null: false               |
| last_name           | string              | null: false               |
| first_name_katakana | string              | null: false               |
| first_name_katakana | string              | null: false               |
| encrypted_password  | string              | null: false               |
| email               | string              | null: false unique: true  |
| year                | string              | null: false               |
| month               | string              | null: false               |
| day                 | string              | null: false               |

### Association

* has_many :items
* has_many :buy-somes


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item-name                           | string     | null: false                    |
| item-money                          | string     | null: false                    |
| exhibitor                           | string     | null: false                    |
| item-status                         | string     | null: false                    |
| payee                               | string     | null: false                    |
| shippingsource                      | string     | null: false                    |
| readtime                            | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :buy-somes

## buy-somes table

| Column      | Type       | Options                         |
|-------------|------------|---------------------------------|
| item-name                     | text       | null: false   |
| item-money                    | references | null: false   |
| purchaser-first_name          | references | null: false   |
| purchaser-last_name           | text       | null: false   |
| purchaser-first_name_katakana | references | null: false   |
| purchaser-last_name_katakana  | references | null: false   |
| purchaser-email               | references | null: false   |


### Association

- belongs_to :delivery
- belongs_to :user

## derivery table

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| purchaser-postcode     | text       | null: false                    |
| buy-somes              | references | null: false, foreign_key: true |
| purchaser-adress       | text       | null: false,                   |


### Association

- belongs_to :buy-somes