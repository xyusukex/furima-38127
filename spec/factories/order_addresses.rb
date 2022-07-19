FactoryBot.define do
  factory :order_address do
    town { '青山1-1-1' }
    city { '横浜市緑区' }
    province_id { 2 }
    post_code { '123-4567' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
