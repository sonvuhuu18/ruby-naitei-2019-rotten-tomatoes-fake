class Medium < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  has_many :reviews

  has_many :celebrity_media
  has_many :celebrities, through: :celebrity_media
end
