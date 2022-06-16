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
|profile              |text       |null: false                    |
|occupation           |text       |null: false                    |
|position             |text       |null: false                    |

### Association



## itemsテーブル
### Association



## purchasesテーブル
### Association



## shipping addressesテーブル
### Association
