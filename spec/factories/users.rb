# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string(255)      not null
#  email                  :string(255)      not null
#  sex                    :integer
#  age                    :integer
#  introduction           :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email       (email) UNIQUE
#  index_users_on_reset_pass  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { "Taro" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { "aaBB1234" }
    password_confirmation { password }
  end
end
