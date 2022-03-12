FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    nickname              { Faker::Name.last_name }
    name                  { Faker::Name.last_name }
    name_kana             { 'カタカナ' }
    tel                   { '09000000000' }
  end
end
