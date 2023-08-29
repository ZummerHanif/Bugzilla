class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "must be unique" }

  belongs_to  :user
  has_many :bugs, dependent: :destroy
end
