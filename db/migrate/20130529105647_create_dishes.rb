class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :desc
      t.integer :price

      t.timestamps
    end
  end
end
