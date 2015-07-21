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
 

 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.


 # Create Posts

 50.times do
   Post.create!(
     user: users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     # user: users.sample,   # we have not yet associated Users with Comments
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
  Question.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    resolved: false
  )
end

30.times do
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: Faker::Number.digit
  )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
    email: 'oriphant@gmail.com',
    password: 'helloworld'
  )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
