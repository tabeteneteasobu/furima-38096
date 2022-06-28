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
|birthday             |date       |null: false                    |


### Association
- has_many :items
- has_many :purchases


## itemsテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|item_name            |string     |null: false                    |
|description          |text       |null: false                    |
|category_id          |integer    |null: false                    |
|condition_id         |integer    |null: false                    |
|postage_payer_id     |integer    |null: false                    |
|prefecture_id        |integer    |null: false                    |
|shipment_date_id     |integer    |null: false                    |
|price                |integer    |null: false                    |
|user                 |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## ordersテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|user                 |references |null: false, foreign_key: true |
|item                 |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address




## addressesテーブル
|Columm               |Type       |Options                        |
|---------------------|-----------|-------------------------------|
|postal_code          |string     |null: false                    |
|prefecture_id        |integer    |null: false                    |
|city                 |string     |null: false                    |
|house_number         |string     |null: false                    |
|building_name        |string     |                               |
|phone_number         |string     |null: false                    |
|order                |references |null: false, foreign_key: true |


### Association
- belongs_to :order