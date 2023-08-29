class AddScreenshotToBugs < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :screenshot, :string
  end
end
