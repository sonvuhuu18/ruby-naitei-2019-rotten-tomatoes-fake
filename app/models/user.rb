class User < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
