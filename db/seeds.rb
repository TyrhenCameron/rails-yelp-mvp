# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Wiping restaurants"

Restaurant.destroy_all

puts "Seeding restaurants"
# make restaurant

5.times do
  restaurant = Restaurant.new(
  name: Faker::TvShows::FamilyGuy.quote,
  address: Faker::Games::FinalFantasyXIV.zone,
  category: CATEGORIES.sample,
  phone_number: Faker::PhoneNumber.cell_phone
  )
  restaurant.save!
  puts "Created #{restaurant.name} (#{restaurant.category})"

  puts "Done! Seeded #{Restaurant.count} restaurants!"
end
