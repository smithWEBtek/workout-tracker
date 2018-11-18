class WorkoutSerializer < ActiveModel::Serializer
	attributes :id, :name, :day, :description
	has_many :exercises
  has_many :days
  belongs_to :user
end
