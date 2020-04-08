# frozen_string_literal: true

# Create Banners
class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.text :message, null: false
      t.date :start,   null: false
      t.date :end,     null: false

      t.timestamps
    end
  end
end
