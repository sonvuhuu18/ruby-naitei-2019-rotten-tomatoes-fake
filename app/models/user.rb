class User < ApplicationRecord
  has_many :news, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum role: {admin: 0, moderator: 1, critic: 2, normal: 3}

  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  ATTR = %i(name email role password password_confirmation).freeze

  validates :name,
    presence: true,
    length: {maximum: Settings.users_name_max_length}
  validates :email,
    presence: true,
    length: {maximum: Settings.users_email_max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password,
    length: {minimum: Settings.users_password_min_length},
    allow_nil: true

  private

  def downcase_email
    email.downcase!
  end
end
