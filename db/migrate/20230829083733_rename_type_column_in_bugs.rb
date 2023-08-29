class RenameTypeColumnInBugs < ActiveRecord::Migration[5.1]
  def change
    rename_column :bugs, :type, :bug_type
  end
end
