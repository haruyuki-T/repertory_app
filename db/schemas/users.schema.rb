# frozen_string_literal: true

create_table :users, force: :cascade, charset: "utf8mb4", collation: "utf8mb4_bin" do |t|
  t.string  :name, null: false
  t.string  :email, null: false
  t.integer  :sex, null: false
  t.integer  :age, null: false
  t.string  :password_digest, null: false
  t.string  :picture
  t.text :introduction
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false
end
