class OrderDish < ActiveRecord::Base
  attr_accessible :dish_id, :number, :order_id
  belongs_to :order
  belongs_to :dish

end
