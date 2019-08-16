class TvShow < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons

  mount_uploader :poster, TvShowPosterUploader

  scope :create_desc, ->{order(created_at: :desc)}

  scope :search_by_name, ->(keyword){where("name LIKE ?", "%#{keyword}%")}

  search_by_release_year = lambda do |keyword|
    joins(:episodes).where("season_number = 1
                            AND episode_number = 1
                            AND extract(year from release_date) = ?", keyword)
  end

  scope :search_by_release_year, search_by_release_year

  ATTR = %i(name info poster).freeze

  validates :name, presence: true,
    length: {maximum: Settings.tvshows.name_max_length}
  validates :info, presence: true,
    length: {maximum: Settings.tvshows.info_max_length}

  def score user_role
    arr = seasons.map{|s| s.score(user_role)}.reject(&:zero?)
    return 0 if arr&.any?
    arr.reduce(:+) / arr.size
  end
end
