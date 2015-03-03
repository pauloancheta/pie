FactoryGirl.define do
  factory :menu do
    association :user, factory: :user
    name "menu name"
  end
end