FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    f.address { Faker::Address.street_name }
    f.phone_number { Faker::PhoneNumber.phone_number }
    f.email { Faker::Internet.email }
    f.password 'lol123'
    f.password_confirmation 'lol123'
  end

   factory :admin, class: User do |f|
    f.is_admin true
    f.name { Faker::Name.name }
    f.address { Faker::Address.street_name }
    f.phone_number { Faker::PhoneNumber.phone_number }
    f.email { Faker::Internet.email }
    f.password 'lol123'
    f.password_confirmation 'lol123'
  end

end
