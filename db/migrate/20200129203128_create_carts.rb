# frozen_string_literal: true

# Create Carts
class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table(:carts, &:timestamps)
  end
end
