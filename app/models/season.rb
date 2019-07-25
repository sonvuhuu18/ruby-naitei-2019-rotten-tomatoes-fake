class Season < ApplicationRecord
  belongs_to :tv_show
  has_many :episodes, dependent: :destroy

  mount_uploader :poster, SeasonPosterUploader

  ATTR = %i(info poster season_number).freeze

  validates :info, presence: true,
    length: {maximum: Settings.seasons.info_max_length}
end
