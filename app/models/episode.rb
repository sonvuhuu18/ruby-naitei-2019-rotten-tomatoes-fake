class Episode < ApplicationRecord
  belongs_to :season
  has_one :medium, as: :reviewable, dependent: :destroy

  ATTR = %i(info release_date episode_number).freeze

  validates :info, presence: true,
    length: {maximum: Settings.episodes.info_max_length}
  validate :unique_episode_number

  private

  def unique_episode_number
    return unless season.episodes.where(episode_number: episode_number).exists?
    errors.add :episode_number, I18n.t(".duplicate")
  end
end
