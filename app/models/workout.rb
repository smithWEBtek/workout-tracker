class Workout < ApplicationRecord
  has_many :exercises
  has_many :days
  belongs_to :user
end
