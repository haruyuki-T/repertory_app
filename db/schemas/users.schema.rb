# frozen_string_literal: true

create_table :users, force: :cascade, charset: "utf8mb4", collation: "utf8mb4_bin" do |t|
  t.string  :name, null: false, limit: 191
  t.string  :email, null: false, limit: 191
  t.integer  :sex
  t.integer  :age
  t.text :introduction, limit: 191
  t.datetime :created_at, null: false
  t.datetime :updated_at, null: false

  ## Database authenticatable
  t.string :encrypted_password, null: false, default: "", limit: 191

  ## Recoverable
  t.string   :reset_password_token, limit: 191
  t.datetime :reset_password_sent_at

  ## Rememberable
  t.datetime :remember_created_at

  t.timestamps null: false
end

add_index :users, :email,                unique: true
add_index :users, :reset_password_token, name: "index_users_on_reset_pass", unique: true
