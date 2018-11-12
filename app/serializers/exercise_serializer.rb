class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :equipment, :description, :muscles
  belongs_to :workout
end
