# frozen_string_literal: true

# == Schema Information
#
# Table name: scenes
#
#  id         :bigint           not null, primary key
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Scene < ApplicationRecord
  has_many :posts, dependent: :destroy
end
