class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :day, :description
end
