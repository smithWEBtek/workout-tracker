class AddWorkoutIndexToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :workout_id, :integer
  end
end
