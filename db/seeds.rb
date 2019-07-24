User.create! name: "Admin User",
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  role: 0

User.create! name: "Moderator User",
  email: "moderator@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  role: 1

25.times do |n|
  name = Faker::Name.name
  email = "critic-#{n+1}@gmail.org"
  password = "password"

  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 2
end

50.times do |n|
  name = Faker::Name.name
  email = "normal-#{n+1}@gmail.org"
  password = "password"

  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 3
end

50.times do |n|
  name = Faker::Movie.quote
  release_date = Faker::Date.between 2.days.ago, Date.today
  critic_score = Faker::Number.decimal 1, 1
  audience_score = Faker::Number.decimal 1, 1
  info = Faker::Lorem.paragraph

  Movie.create! name: name,
    release_date: release_date,
    critic_score: critic_score,
    audience_score: audience_score,
    info: info,
    poster: open("#{Rails.root}/poster.jpg")
end
