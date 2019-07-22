class Celebrity < ApplicationRecord
  has_many :celebrity_media
  has_many :media, through: :celebrity_media
end
