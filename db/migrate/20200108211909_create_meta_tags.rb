# frozen_string_literal: true

# Create MetaTags
class CreateMetaTags < ActiveRecord::Migration[6.0]
  def change
    create_table :meta_tags do |t|
      t.string :name, null: false

      t.timestamps

      t.index [:name], unique: true
    end
  end
end
