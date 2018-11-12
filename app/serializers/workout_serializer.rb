class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :name, :day, :description
  belongs_to :user
end
