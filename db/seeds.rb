require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all


# Create Topics
15.times do
  Topic.create(
    name:         Faker::Lorem.sentence,
    description:  Faker::Lorem.paragraph
  )
end
topics = Topic.all


# Create Posts
50.times do
  post = Post.create(
    user:   users.sample,
    topic:  topics.sample,
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
end

posts = Post.all

# Create Comments
post_count = Post.count
User.all.each do |user|
  rand(30..50).times do
    p = Post.find(rand(1..post_count))
    c = user.comments.create(
      body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"),
      post: p)
    c.update_attribute(:created_at, Time.now - rand(600..31536000))
  end
end

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save

# Create a moderator
moderator = User.new(
  name:     'Moderator User',
  email:    'moderator@example.com', 
  password: 'helloworld',
  role:     'moderator'
)
moderator.skip_confirmation!
moderator.save

# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
)
member.skip_confirmation!
member.save


puts "Seed finished"
puts "#{User.count} Users created"
puts "#{Topic.count} Topics created"
puts "#{Post.count} Posts created"
puts "#{Comment.count} Comments created"