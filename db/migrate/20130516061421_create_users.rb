class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar
      t.string :role
      t.boolean :blocked, :default => true
      t.integer :reward

      t.timestamps
    end
  end
end
