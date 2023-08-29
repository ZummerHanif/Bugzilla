class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: 'User', optional: true
  mount_uploader :screenshot, ScreenshotUploader


  validates :title, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }
  validates :status, :bug_type, presence: true


  enum bug_type: { feature: 'feature', bug: 'bug' }
  enum status: { New: 'New', started: 'started', resolved: 'resolved' }



end
