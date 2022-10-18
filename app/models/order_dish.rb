class OrderDish < ActiveRecord::Base
  belongs_to :order
  belongs_to :dish

  after_destroy :check_order

  def check_order
    if self.order && self.order.order_dishes.empty?
      self.order.destroy
    end
  end
end
