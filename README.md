## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|e-mail|string|null:false, unique::true|

### Association
- has_many: posts
- has_many: messages

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|song|string|null:false|
|singer|string|null:false|
|lyric|text|null:false|
|comment|text|null:false|
|user_id|integer|null:false, foreign_key::true|

### Association
- belongs_to: user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|user_id|integer|null:false, foreign_key::true|

### Association
- belongs_to: user
