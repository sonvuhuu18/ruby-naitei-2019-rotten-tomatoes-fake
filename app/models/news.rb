class News < ApplicationRecord
  belongs_to :user

  delegate :name, to: :user, prefix: true

  enum status: {pending: 0, approved: 1, rejected: 2}

  scope :create_desc, ->{order created_at: :desc}
  scope :update_desc, ->{order updated_at: :desc}

  ATTR = %i(content status title).freeze

  validates :content, presence: true,
    length: {maximum: Settings.news.content_max_length}
end
