class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :assigned_projects, through: :user_projects, source: :project

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        def manager?
          user_type == 'Manager'
        end

        def qa?
          user_type == 'Qa'
        end

        def developer?
          user_type == 'Developer'
        end
end
