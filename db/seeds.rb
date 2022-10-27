# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning the database 🧹"
Pet.destroy_all
puts "Here are some new sweet-pets"

users = User.pluck(:id)

20.times do
  Pet.create(
    name: Faker::FunnyName.two_word_name,
    city: "Berlin",
    species: ["dog", "cat", "piglet", "monkey", "rabbit"].sample,
    age: ["1", "2", "3", "4", "9", "12", "16"].sample,
    category: ["Sassy", "Funny", "Needy", "Mischievous"].sample,
    postcode: Faker::Address.postcode,
    description: "lovely pet, very friendly",
    user_id: users.sample
  )
end
