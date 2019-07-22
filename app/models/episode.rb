class Episode < ApplicationRecord
  belongs_to :season
  has_one :medium, as: :reviewable, dependent: :destroy
end
