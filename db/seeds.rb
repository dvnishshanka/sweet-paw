# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database 🧹"
Booking.destroy_all
Pet.destroy_all
User.destroy_all

puts "Here are some new sweet-pets"

User.create(email: "sara@gmail.com", password: "123456")
User.create(email: "andy@gmail.com", password: "123456")
User.create(email: "vidu@gmail.com", password: "123456")
users = User.pluck(:id)

20.times do
  Pet.create(
    name: Faker::FunnyName.two_word_name,
    city: "Berlin",
    species: ["dog", "cat", "piglet", "monkey", "rabbit"].sample,
    age: ["1", "2", "3", "4", "9", "12", "16"].sample,
    category: ["Sassy", "Innocent", "Funny", "Grumpy", "Needy", "Mischievous"].sample,
    address: ["Rudi-Dutschke-Straße 26, 10969", "Danziger Str. 33, 10435",
       "Prinzenstraße 113-119, 10969", "Spandauer Damm 10-22, 14059",
       "Gleimstraße 55, 10437", "Kottbusser Damm 32, 10967", "Maybachufer 20, 12047",
      "Dunckerstraße 80A, 10437", "Sophienstraße 21, 10178", "Warschauer Str. 74, 10243"].sample,
    description: "lovely pet, very friendly loves to be outside
    needs alot of treats, very comfortable around people but maybe avoid small children",
    user_id: users.sample
  )
end
