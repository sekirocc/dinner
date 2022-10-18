# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  validates_presence_of :nickname
  validates_uniqueness_of :nickname, :email

  belongs_to :department

  has_many :orders

  ADMIN_USER = %w(TestUser)

  def admin?
    ADMIN_USER.include? nickname
  end

  def can_manage_dishes?
    ADMIN_USER.include? nickname
  end


end
