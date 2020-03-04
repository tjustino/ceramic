# frozen_string_literal: true

# Create Users
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false#, index: { unique: true }
      t.string :password_digest, null: false
      t.boolean :is_admin, default: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
