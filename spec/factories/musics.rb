# frozen_string_literal: true

FactoryBot.define do
  factory :scene do
    title { "未分類" }

    initialize_with do
      Scene.find_or_initialize_by(
        id: 1,
        title: "未分類")
    end
  end
end
