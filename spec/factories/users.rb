FactoryBot.define do
  factory :user do
    name {"Name"}
    sequence(:email) {|n| "user#{n}"}
    password {"IamPassword"}
  end
end
