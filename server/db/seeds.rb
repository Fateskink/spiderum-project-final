# Create a main sample user.
User.create!(name: "Admin",
  email: "admin@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

# Generate a bunch of additional users.
49.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123123"
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password,
  activated: true,
  activated_at: Time.zone.now)
end

# Generate posts for a subset of users.
users = User.order(:created_at).take(8)
30.times do
  title = "This is title"
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content: content, title: title) }
end