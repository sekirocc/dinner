class CreateOrderDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :order_dishes do |t|
      t.integer :order_id
      t.integer :dish_id
      t.integer :number

      t.timestamps
    end
  end
end
