User.create! name: "Admin User",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 0

User.create! name: "Moderator User",
  email: "user@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 1

10.times do |n|
  name = Faker::Name.name
  email = "critic-#{n+1}@gmail.org"
  password = "password"

  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 2
end

20.times do |n|
  name = Faker::Name.name
  email = "normal-#{n+1}@gmail.org"
  password = "password"

  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 3
end

20.times do |n|
  name = Faker::Lorem.sentence 3
  release_date = Faker::Date.between 2.days.ago, Date.today
  # critic_score = Faker::Number.decimal 1, 1
  # audience_score = Faker::Number.decimal 1, 1
  info = Faker::Lorem.paragraph 2, false, 10

  Movie.create! name: name,
    release_date: release_date,
    # critic_score: critic_score,
    # audience_score: audience_score,
    info: info,
    poster: open("#{Rails.root}/poster.jpg")
end

20.times do |n|
  name = Faker::Lorem.sentence 3
  info = Faker::Lorem.paragraph 2, false, 10

  TvShow.create! name: name,
    info: info,
    poster: open("#{Rails.root}/poster.jpg")
end

tvshows = TvShow.all
tvshows.each do |tvshow|
  Faker::Number.within(1..5).times do |n|
    info = Faker::Lorem.paragraph 2, false, 10
    tv_show_id = tvshow.id
    season_number = n + 1

    Season.create! info: info,
      tv_show_id: tv_show_id,
      poster: open("#{Rails.root}/poster.jpg"),
      season_number: season_number
  end
end

seasons = Season.all
seasons.each do |season|
  Faker::Number.within(5..25).times do |n|
    release_date = Faker::Date.between 100.days.ago, Date.today
    # critic_score = Faker::Number.decimal 1, 1
    # audience_score = Faker::Number.decimal 1, 1
    season_id = season.id
    info = Faker::Lorem.paragraph 2, false, 10
    episode_number = n + 1

    Episode.create! release_date: release_date,
      # critic_score: critic_score,
      # audience_score: audience_score,
      season_id: season_id,
      info: info,
      episode_number: episode_number
  end
end

30.times do |n|
  name = Faker::Name.name
  date_of_birth = Faker::Date.birthday 5, 85
  gender = Faker::Number.within(0..1)
  nationality = Faker::Nation.nationality

  Celebrity.create! name: name,
    date_of_birth: date_of_birth,
    gender: gender,
    nationality: nationality,
    portrait: open("#{Rails.root}/poster.jpg")
end

users = User.all
users_news = users.last(users.size - 2)
users_news.each do |user|
  Faker::Number.within(0..5).times do |n|
    user_id = user.id
    content = Faker::Lorem.paragraph 2, false, 10

    News.create! user_id: user_id,
      content: content
  end
end

movies = Movie.all
movies.each do |movie|
  Medium.create! reviewable: movie
end

episodes = Episode.all
episodes.each do |episode|
  Medium.create! reviewable: episode
end

users = User.all
users_reviewable = users.last(users.size - 2)
medium = Medium.all
users_reviewable.each do |user|
  medium.each do |media|
    Faker::Number.within(0..1).times do |n|
      user_id = user.id
      medium_id = media.id
      content = Faker::Lorem.paragraph 2, false, 10
      score = Faker::Number.decimal 1, 1

      Review.create! user_id: user_id,
        medium_id: medium_id,
        content: content,
        score: score
    end
  end
end

medium = Medium.all
celebrities = Celebrity.all
medium.each do |media|
  Faker::Number.within(3..5).times do |n|
    celebrity_id = Faker::Number.between 1, celebrities.size
    medium_id = media.id
    role = Faker::Number.within(0..1)

    CelebrityMedium.create! celebrity_id: celebrity_id,
      medium_id: medium_id,
      role: role
  end
end
