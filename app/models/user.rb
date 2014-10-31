class User < ActiveRecord::Base

  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end

  has_many :formularios
  belongs_to :efederativa

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nombre, :ap_pat, :ap_mat, :efederativa_id, :jurisdiction_id
  # attr_accessible :title, :body
end
