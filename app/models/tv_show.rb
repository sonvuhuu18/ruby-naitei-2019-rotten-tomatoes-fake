class TvShow < ApplicationRecord
  has_many :seasons, dependent: :destroy

  mount_uploader :poster, TvShowPosterUploader

  scope :create_desc, ->{order(created_at: :desc)}

  ATTR = %i(name info poster).freeze

  validates :name, presence: true,
    length: {maximum: Settings.tvshows.name_max_length}
  validates :info, presence: true,
    length: {maximum: Settings.tvshows.info_max_length}
end
