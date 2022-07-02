# frozen_string_literal: true

create_table :scenes, force: :cascade, charset: "utf8mb4", collation: "utf8mb4_bin" do |t|
  t.string :title, null: false, limit: 191
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false
end
