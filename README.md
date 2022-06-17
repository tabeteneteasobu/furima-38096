#テーブル設計

## usersテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|nickname             |string     |null: false,                   |
|email                |string     |null: false, unique: true      |
|encrypted_password   |string     |null: false                    |
|first_name           |string     |null: false                    |
|last_name            |string     |null: false                    |
|first_name_kana      |string     |null: false                    |
|last_name_kana       |string     |null: false                    |
|birth_year_id        |integer    |null: false                    |
|birth_month_id       |integer    |null: false                    |
|birth_day_id         |integer    |null: false                    |
### Association
- has_many :items
- has_one :purchase


## itemsテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|item_name            |string     |null: false                    |
|description          |string     |null: false                    |
|category_id          |integer    |null: false                    |
|condition_id         |integer    |null: false                    |
|postage_payer_id     |integer    |null: false                    |
|shipment_place_id    |integer    |null: false                    |
|shipment_date_id     |integer    |null: false                    |
|price                |integer    |null: false                    |
|user                 |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## purchasesテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|user                 |references |null: false, foreign_key: true |
|item                 |references |null: false, foreign_key: true |

### Association
- has_one :shipping_address



## shipping_addressesテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|postal_code          |integer    |null: false                    |
|prefecture_id        |integer    |null: false                    |
|city                 |string     |null: false                    |
|address              |string     |null: false                    |
|building             |string     |                               |
|phone_number         |integer    |null: false                    |
|user                 |references |null: false, foreign_key: true |

### Association
- belongs_to :purchase