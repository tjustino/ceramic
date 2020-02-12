class CreateProductCartRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :product_cart_relations do |t|
      t.references :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
