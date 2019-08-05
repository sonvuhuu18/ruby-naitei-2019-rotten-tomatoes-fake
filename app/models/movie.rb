class Movie < ApplicationRecord
  after_create :create_medium

  has_one :medium, as: :reviewable, dependent: :destroy
  mount_uploader :poster, PosterUploader

  scope :create_desc, ->{order name: :desc}
  scope :create_top_new, ->{order release_date: :desc}
  scope :create_top_score, ->{order critic_score: :desc}
  scope :top_new_show, ->{limit Settings.movies.top}
  scope :top_score_show, ->{limit Settings.movies.top}
  scope :top_new_more, ->{offset Settings.movies.top}
  scope :top_score_more, ->{offset Settings.movies.top}

  scope :search_by_name, ->(keyword){where("name LIKE ?", "%#{keyword}%")}
  search_by_release_year = lambda do |keyword|
    where("extract(year from release_date) = ?", keyword)
  end
  scope :search_by_release_year, search_by_release_year

  ATTR = %i(name release_date critic_score audience_score info poster).freeze

  validates :name, presence: true,
    length: {maximum: Settings.movies.name_max_length}
  validates :info, presence: true,
    length: {maximum: Settings.movies.info_max_length}

  def score user_role
    medium.reviews
          .joins(:user).where(users: {role: user_role}).average(:score) || 0
  end
end
