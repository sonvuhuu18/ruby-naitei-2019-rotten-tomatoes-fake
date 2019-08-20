class Request < ApplicationRecord
  after_update :update_user

  belongs_to :user

  delegate :name, to: :user, prefix: true

  scope :update_desc, ->{order updated_at: :desc}

  enum status: {pending: 0, approved: 1, rejected: 2}

  ATTR = %i(user_id status).freeze

  validate :duplicate_request

  private

  def duplicate_request
    return unless user.requests.where(status: :pending).exists?
    errors.add :user, I18n.t(".already_requested")
  end

  def update_user
    return unless approved?
    user.update_attributes role: :critic
  end
end
