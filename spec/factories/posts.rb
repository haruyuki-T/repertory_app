# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  scene_id    :bigint           not null
#  artist_name :string(255)      not null
#  song_title  :string(255)      not null
#  comment     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :post do
    user_id { "1" }
    scene_id { "1" }
    artist_name { "TestArtistName" }
    song_title { "TestSongTitle" }
  end
end
