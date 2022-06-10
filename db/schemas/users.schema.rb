# frozen_string_literal: true

create_table :users, force: :cascade, charset: "utf8mb4", collation: "utf8mb4_bin" do |t|
  t.string  :name, null: false
  t.string  :email, null: false
  t.integer  :sex
  t.integer  :age
  t.string :picture
  t.text :introduction
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false

  ## Database authenticatable
  t.string :encrypted_password, null: false, default: ""

  ## Recoverable
  t.string   :reset_password_token
  t.datetime :reset_password_sent_at

  ## Rememberable
  t.datetime :remember_created_at

  t.timestamps null: false
end

add_index :users, :email,                unique: true
add_index :users, :reset_password_token, unique: true
