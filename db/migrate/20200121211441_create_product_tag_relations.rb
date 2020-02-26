# frozen_string_literal: true

# Create relations between Products and Tags
class CreateProductTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :product_tag_relations do |t|
      t.references :product, null: false, foreign_key: true
      t.references :tag,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
