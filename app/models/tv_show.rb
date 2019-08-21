class TvShow < ApplicationRecord
  include Search
  has_many :seasons, dependent: :destroy

  mount_uploader :poster, TvShowPosterUploader

  validates :name, presence: true,
    length: {maximum: Settings.tvshows.name_max_length}
  validates :info, presence: true,
    length: {maximum: Settings.tvshows.info_max_length}

  scope :create_desc, ->{order(created_at: :desc)}
  scope :create_top_score, (
    lambda do
      sort_by{|tv| [tv.score(:critic), tv.score(:normal)]}.reverse
    end)

  scope :load_all, (
    lambda do
      joins(:celebrities).all.select("tv_shows.id, celebrities.name, "\
      "tv_shows.name as film_name, episodes.release_date")
    end)
  scope :list_search, ->(tvshows_id){find(tvshows_id)}

  scope :celebrities_list, (
    lambda do |tvshow_id|
      Celebrity.where(
        id: includes(seasons:
          [episodes: [medium:
            [celebrity_media: :celebrity]]]).where(id: tvshow_id)
                                            .pluck("celebrities.id").uniq
      )
    end)

  ATTR = %i(name info poster).freeze

  def score user_role
    arr = seasons.map{|s| s.score(user_role)}.reject(&:zero?)
    return 0 if arr&.empty?
    arr.reduce(:+) / arr.size
  end
end
