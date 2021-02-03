# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |i|
  Movie.create(name: "Movie #{i}")
end

(1..3).each do |i|
  Theatre.create(name: "Theatre #{i}", capacity: [50, 75, 100].sample)
end

(1..10).each do |i|
  Screening.create(
    movie_id: Movie.pluck(:id).sample,
    theatre_id: Theatre.pluck(:id).sample,
    price: [350, 500, 100].sample,
    start_at: ["12:00", "3:00", "6:00", "9:00"].sample
  )
end

#Admin & Test User
User.create(name: "Admin User", email: "admin@test.com", password: "temp1234", password_confirmation: "temp1234", is_admin: true)
User.create(name: "Test User", email: "user@test.com", password: "temp1234", password_confirmation: "temp1234")