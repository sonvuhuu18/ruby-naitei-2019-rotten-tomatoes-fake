class News < ApplicationRecord
  belongs_to :user

  delegate :name, to: :user, prefix: true

  scope :create_desc, ->{order created_at: :desc}

  validates :content, presence: true,
    length: {maximum: Settings.news.content_max_length}
end
