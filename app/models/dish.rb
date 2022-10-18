class Dish < ActiveRecord::Base

  has_many :order_dishes, :dependent => :destroy

  scope :active, :conditions => "#{Dish.table_name}.disable = false"

end
