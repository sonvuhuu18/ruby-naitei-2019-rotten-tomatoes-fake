class Review < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  ATTR = %i(user_id medium_id content score).freeze

  scope :create_desc, ->{order created_at: :desc}

  scope :movie, ->{joins(:medium).merge(Medium.type("Movie"))}
  scope :episode, ->{joins(:medium).merge(Medium.type("Episode"))}

  scope :critic, ->{joins(:user).merge(User.role(Settings.users.role.critic))}
  scope :audience, ->{joins(:user).merge(User.role(Settings.users.role.normal))}

  scope :id, ->(id){joins(:medium).merge(Medium.reviewable_id(id))}

  scope :movie_critic_score, ->(id){movie.critic.id(id).average(:score)}
  scope :movie_audience_score, ->(id){movie.audience.id(id).average(:score)}

  scope :episode_critic_score, ->(id){episode.critic.id(id).average(:score)}
  scope :episode_audience_score, ->(id){episode.audience.id(id).average(:score)}
end
