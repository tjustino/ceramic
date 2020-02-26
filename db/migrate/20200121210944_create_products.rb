# frozen_string_literal: true

# Create Products
class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string  :name,        null: false
      t.text    :description
      t.decimal :price,       null: false, precision: 8, scale: 2
      t.boolean :is_promoted, default: false

      t.timestamps
    end
  end
end
