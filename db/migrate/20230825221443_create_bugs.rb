class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :status
      t.string :type
      t.date :deadline
      t.text :description
      t.string :screenshot

      t.references :project, foreign_key: true

      t.timestamps
    end
    add_index :bugs, :title, unique: true
  end
end
