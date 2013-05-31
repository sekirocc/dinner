class Dish < ActiveRecord::Base
  attr_accessible :desc, :name, :price, :disable

  has_many :order_dishes, :dependent => :destroy

  scope :active, :conditions => "#{Dish.table_name}.disable = false"
  
end
