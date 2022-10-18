class Order < ActiveRecord::Base

  has_many :order_dishes, :dependent => :destroy

  belongs_to :user


end
