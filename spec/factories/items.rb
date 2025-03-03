FactoryBot.define do
  factory :item do
    item_name        { '太郎' }
    item_money       { 500 }
    item_manual      { '山田' }
    category_id      { 2 }
    item_status_id   { 3 }
    payee_id         { 2 }
    shippingsource_id { 2 }
    readtime_id      { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end
  end
end