class OrderDish < ActiveRecord::Base
  attr_accessible :dish_id, :number, :order_id
  belongs_to :order
  belongs_to :dish

  after_destroy :check_order

  def check_order
    if self.order && self.order.order_dishes.empty?
      self.order.destroy
    end
  end
end
