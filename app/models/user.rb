class User < ApplicationRecord
  has_many :projects
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def manager?
    user_type == 'manager'
  end
end

