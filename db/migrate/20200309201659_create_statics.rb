# frozen_string_literal: true

# Create Statics Tables
class CreateStatics < ActiveRecord::Migration[6.0]
  def change
    create_table :statics do |t|
      t.integer :page

      t.timestamps
    end
  end
end
