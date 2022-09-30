# Create a main sample user.
User.create!(name: "Admin",
  email: "admin@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

# Generate a bunch of additional users.
29.times do |n|
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
10.times do
  content = Faker::Lorem.sentence(word_count: 5)
  title = "This is title"
  users.each { |user| user.posts.create!(content: content, title: title) }
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..20]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

#create tag name
Tag.create(tag_name: 'Inspire')
Tag.create(tag_name: 'Controversial opinion')
Tag.create(tag_name: 'Science')
Tag.create(tag_name: 'Sport')
Tag.create(tag_name: 'Content Creator')
Tag.create(tag_name: 'Film')
Tag.create(tag_name: 'Music')
Tag.create(tag_name: 'English zone')
Tag.create(tag_name: 'Skill')