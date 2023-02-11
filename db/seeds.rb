# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# USERSSS
# users = User.create([
#     { name: "Park In Go",  email: 'park@qt.com',  password: 'password' },
#     { name: "Felipe",   email: 'fil@qt.com',  password: 'password' },
#     { name: "Aer",  email: 'Ariel@qt.com', password: 'password' },
#     { name: "Kev", email: 'Kevin@qt.com', password: 'password' },
#     { name: "Ka Sava", email: 'Sava@qt.com', password: 'password' },
#     { name: "Tyson", email: 'Mike@qt.com', password: 'password' },
#     { name: "Junard", email: 'junard@qt.com', password: 'password' },
#     { name: "Allv", email: 'Alvaro@qt.com', password: 'password' }])
  
  users = User.all

#POSTSSS
  posts = Post.create!([
    { user_id: rand(5..10),  title: Faker::Lorem.unique.sentence,  body: Faker::Lorem.paragraphs(number: 2) },
    { user_id: rand(5..10),  title: Faker::Lorem.unique.sentence,  body: Faker::Lorem.paragraphs(number: 3) },
    { user_id: rand(5..10),  title: Faker::Lorem.unique.sentence,  body: Faker::Lorem.paragraphs(number: 5) },
    { user_id: rand(5..10),  title: Faker::Lorem.unique.sentence,  body: Faker::Lorem.paragraphs(number: 2) },
    { user_id: rand(5..10),  title: Faker::Lorem.unique.sentence,  body: Faker::Lorem.paragraphs(number: 1) },
  ])
  
  posts = Post.all

# COMMENTSSSS
  posts.each do |post|
    rand(0..2).times do
      # assign random user id from 1-5 (there is no 0)
      post.comments.create(post_id: rand(2..13), body: Faker::Lorem.sentence, name: post.user.name)
    end
  end
  

  # each post have random number of likes (0 - 4)
#   posts = Post.all
#   posts.each do |post|
#     rand(0..3).times do
#       post.likes.create(user_id: rand(5..10), post_id: rand(5..13))
#     end
#   end
  
  
#   # 2 friends for each user:
#   users = User.all
#   2.times do
#     users.each do |user|
  
#       # requestee can't be the same as current user
#       requestee_id_num = rand(1..8)
#       while requestee_id_num == user.id || user.requestees.include?(User.find(requestee_id_num)) do
#         requestee_id_num = rand(1..8)
#       end
  
#       user.sent_requests.create(requestee_id: requestee_id_num, accepted: 1)
#       User.find(requestee_id_num).sent_requests.create(requestee_id: user.id, accepted: 1)
#     end
#   end