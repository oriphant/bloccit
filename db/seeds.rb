require 'faker'

  # Create Users
  users = User.all
  
  5.times do
     user = User.new(
       name:     Faker::Name.name,
       email:    Faker::Internet.email,
       password: Faker::Lorem.characters(10)
     )
     user.skip_confirmation!
     user.save!
  end

 # Create Topics
  15.times do
    Topic.create!(
      name: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph
      )
  end
  topics = Topic.all

# Create Posts
 50.times do
   Post.create!(
     user: users.sample,
     topic:  topics.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     # user: users.sample,   # we have not yet associated Users with Comments
     user: users.sample
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

if Post.where(title:"A Unique Entry").exists?
  p "Already exists"
else
 Post.create!(
  user: users.sample,
  title: "A Unique Entry",
  body: "The fox jumped over the cat"
)
end

30.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Number.digit
  )
end

# user = User.first
# user.skip_reconfirmation!
# user.update_attributes!(
#     email: 'oriphant@gmail.com',
#     password: 'helloworld'
#   )

# Create an admin user
admin = User.new(
  name: 'Admin Man',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  name: 'Mod Man',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'moderator'
  )
moderator.skip_confirmation!
moderator.save!

#Create a member
member = User.new(
  name: 'Member Man',
  email: 'member@example.com',
  password: 'helloworld'
  )
member.skip_confirmation!
member.save!

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
