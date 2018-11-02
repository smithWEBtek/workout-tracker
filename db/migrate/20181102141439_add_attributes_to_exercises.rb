class AddAttributesToExercises < ActiveRecord::Migration[5.2]
  def change
    add_column :exercises, :reps, :integer
    add_column :exercises, :sets, :integer
    add_column :exercises, :rest, :integer
  end
end
