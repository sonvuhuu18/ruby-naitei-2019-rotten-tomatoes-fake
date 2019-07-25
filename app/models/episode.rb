class Episode < ApplicationRecord
  belongs_to :season
  has_one :medium, as: :reviewable, dependent: :destroy

  validates :info, presence: true,
    length: {maximum: Settings.episodes.info_max_length}
end
