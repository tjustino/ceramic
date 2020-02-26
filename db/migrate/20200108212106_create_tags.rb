# frozen_string_literal: true

# Create Tags
class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string     :name,     null: false
      t.references :meta_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
