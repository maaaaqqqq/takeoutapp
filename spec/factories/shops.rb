FactoryBot.define do
  factory :shop do
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    name                  { Faker::Name.last_name }
    name_kana             { 'カタカナ' }
    text                  { Faker::Lorem.sentence }
    address               { Faker::Address.street_address }
    holiday               { Faker::Lorem.words }
    parking_id            { Faker::Number.between(from: 2, to: 4) }
    genre_id              { Faker::Number.between(from: 2, to: 13) }
    tel                   { '09000000000' }
    building_name         { Faker::Address.city }
    opentime_at           { '12:00:00' }
    closetime_at          { '18:00:00' }
    parking_explain       { Faker::Lorem.sentence }
  end
end
