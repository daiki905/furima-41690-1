FactoryBot.define do
  factory :user do
    first_name { "太郎" }  # 適切な全角文字を使用
    last_name { "山田" }    # 適切な全角文字を使用
    first_name_katakana { "タロウ" }  # カタカナを使用
    last_name_katakana { "ヤマダ" }   # カタカナを使用
    nickname { Faker::Internet.username }
    birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    email { Faker::Internet.unique.email }
    password { 'password1' }
    password_confirmation { 'password1' }
  end
end