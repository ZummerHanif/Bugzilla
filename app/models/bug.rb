class Bug < ApplicationRecord
  belongs_to :project
  mount_uploader :screenshot, ScreenshotUploader


  validates :title, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }
  validates :status, :bug_type, presence: true


end
