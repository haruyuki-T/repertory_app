# frozen_string_literal: true

create_table :posts, force: :cascade, charset: "utf8mb4", collation: "utf8mb4_bin" do |t|
  t.bigint :user_id, null: false
  t.bigint :scene_id, null: false
  t.string  :artist_name, null: false, limit: 191
  t.string  :song_title, null: false, limit: 191
  t.string  :comment, limit: 191
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false
end
