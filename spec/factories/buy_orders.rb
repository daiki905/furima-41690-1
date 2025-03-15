FactoryBot.define do
  factory :buy_order do

    adress_num { "100-0000" }
    prefecture_id { 2 }
    first_adress { "Tokyo" }
    second_adress { "Shibuya" }
    bulding_name { "Hikarie" }
    tel_num { "09012345678" }
    token { 'tok_abcdefghijk00000000000000000' }
    
    
    
  end
end
