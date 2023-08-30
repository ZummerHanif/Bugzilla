class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  mount_uploader :screenshot, ScreenshotUploader


  validates :title, presence: true, uniqueness: { case_sensitive: false, message: "must be unique" }
  validates :status, :bug_type, presence: true
  validate :valid_screenshot_format,if: -> { screenshot.present? }


  def valid_screenshot_format
    return unless screenshot

    unless screenshot.content_type.in?(%w(image/png image/gif))
      errors.add(:screenshot, 'must be a .png or .gif image')
    end
  end

end
