FactoryBot.define do
  factory :user do
      first_name { "John" }
      last_name { "Doe" }
      first_name_katakana { "ジョン" }
      last_name_katakana { "ドウ" }
      nickname { "johndoe" }
      birth { "2000-01-01" }
      email { "johndoe@example.com" }
      password { "password1" }
      password_confirmation { "password1" }
    
  end
end
