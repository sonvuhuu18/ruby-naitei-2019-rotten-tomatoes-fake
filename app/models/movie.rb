class Movie < ApplicationRecord
  has_one :medium, as: :reviewable, dependent: :destroy
end
