class Day < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  belongs_to :user

end
