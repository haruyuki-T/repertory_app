# frozen_string_literal: true

FactoryBot.define do
  factory :scene do
    trait :a do
      id { 1 }
      title { "未分類" }
    end

    trait :b do
      id { 2 }
      title { "同年代" }
    end

    trait :c do
      id { 3 }
      title { "上司" }
    end
  end
end
