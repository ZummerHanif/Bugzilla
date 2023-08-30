class AddCreatorToBugs < ActiveRecord::Migration[5.1]
  def change
    add_reference :bugs, :creator, foreign_key: true
  end
end
