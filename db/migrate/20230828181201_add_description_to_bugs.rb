class AddDescriptionToBugs < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :description, :text
  end
end
