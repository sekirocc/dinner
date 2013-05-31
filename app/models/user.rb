# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :avatar, :blocked, :email, :nickname, :reward, :role

  validates_presence_of :nickname
  validates_uniqueness_of :nickname, :email

  mount_uploader :avatar, AvatarUploader

  has_many :orders

  def admin?
    nickname == '陈界'
  end

  def can_manage_dishes?
    nickname == '陈界'
  end
  
end
