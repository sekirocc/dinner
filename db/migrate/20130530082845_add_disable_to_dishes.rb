class AddDisableToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :disable, :boolean, :default => true
  end
end
