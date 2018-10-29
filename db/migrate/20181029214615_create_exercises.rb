class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :equipment
      t.string :description
      t.string :muscles

      t.timestamps
    end
  end
end
