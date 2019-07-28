class Celebrity < ApplicationRecord
  has_many :celebrity_media, dependent: :destroy
  has_many :media, through: :celebrity_media

  mount_uploader :portrait, PortraitUploader

  scope :create_desc, ->{order name: :desc}

  ATTR = %i(name date_of_birth gender nationality portrait).freeze

  validates :name, presence: true,
    length: {maximum: Settings.celebrities.name_max_length}
end
