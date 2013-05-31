class Order < ActiveRecord::Base
  attr_accessible :user_id

  has_many :order_dishes, :dependent => :destroy

  belongs_to :user


end
