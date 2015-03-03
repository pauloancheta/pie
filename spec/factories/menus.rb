# FactoryGirl.define do
#   factory :menu do
#     association :user, factory: :user
#     sequence(:name) {|n| "#{Faker::Company.bs}-#{n}"}
#   end
# end