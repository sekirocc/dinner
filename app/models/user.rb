# encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :avatar, :blocked, :email, :nickname, :reward, :role, :department_id

  validates_presence_of :nickname
  validates_uniqueness_of :nickname, :email

  belongs_to :department

  mount_uploader :avatar, AvatarUploader

  has_many :orders

  ADMIN_USER = %w( 陈界 孙彬彬 张建 姚佳余)

  def admin?
    ADMIN_USER.include? nickname
  end

  def can_manage_dishes?
    ADMIN_USER.include? nickname
  end

  
end
