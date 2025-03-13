FactoryBot.define do
  factory :delivery do

    adress_num { "100-0000" }
    prefecture_id { 1 }
    first_adress { "Tokyo" }
    second_adress { "Shibuya" }
    bulding_name { "Hikarie" }
    tel_num { "09012345678" }
    association :buy_some
    
  end
end
