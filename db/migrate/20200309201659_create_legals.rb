class CreateLegals < ActiveRecord::Migration[6.0]
  def change
    create_table :legals do |t|
      t.integer :title

      t.timestamps
    end
  end
end
