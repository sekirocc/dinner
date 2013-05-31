class AddDisableToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :disable, :boolean, :default => true
  end
end
