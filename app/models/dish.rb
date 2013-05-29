class Dish < ActiveRecord::Base
  attr_accessible :desc, :name, :price

  has_many :order_dishes
end
