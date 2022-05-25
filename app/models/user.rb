# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  email           :string(255)      not null
#  sex             :integer          not null
#  age             :integer          not null
#  password_digest :string(255)      not null
#  picture         :string(255)
#  introduction    :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :posts, dependent: :destroy

end
