class Workout < ApplicationRecord
  has_many :exercises
  has_many :days, through: :exercises
end
