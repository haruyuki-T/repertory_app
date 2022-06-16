# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { "Taro" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { "aaBB1234" }
    password_confirmation { password }
  end
end
