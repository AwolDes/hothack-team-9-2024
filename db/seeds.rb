# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb

# You can update this to just be your user id if you want
# user_id = YOU_ID
# Then change user.id to user_id
current_time = Time.now.to_i
user = User.create(email: "user#{current_time}@example.com", password: 'password', password_confirmation: 'password')

# Create some sample tours
tour1 = Tour.create(
  name: "European Adventure", 
  start_date: Date.new(2024, 5, 1), 
  finish_date: Date.new(2024, 5, 15),
  budget: 30000,
  user_id: user.id
)

tour2 = Tour.create(
  name: "Asian Expedition", 
  start_date: Date.new(2024, 6, 10), 
  finish_date: Date.new(2024, 6, 25),
  budget: 50000,
  user_id: user.id
)

# Create some expenses for each tour
Expense.create([
  { date: Date.new(2024, 5, 2), city: 'Paris', cost: 200.50, state: 'France', category: "venue", tour: tour1 },
  { date: Date.new(2024, 5, 3), city: 'Berlin', cost: 180.75, state: 'Germany', category: "hotel", tour: tour1 },
  { date: Date.new(2024, 6, 11), city: 'Tokyo', cost: 300.00, state: 'Japan', category: "venue", tour: tour2 },
  { date: Date.new(2024, 6, 12), city: 'Seoul', cost: 250.00, state: 'South Korea', category: "venue", tour: tour2 },
  { date: Date.new(2024, 5, 4), city: 'Barcelona', cost: 180.00, state: 'Spain', category: "restaurant", tour: tour1 },
  { date: Date.new(2024, 5, 5), city: 'Rome', cost: 220.75, state: 'Italy', category: "attraction", tour: tour1 },
  { date: Date.new(2024, 5, 6), city: 'Vienna', cost: 190.25, state: 'Austria', category: "hotel", tour: tour1 },
  { date: Date.new(2024, 5, 7), city: 'Prague', cost: 210.50, state: 'Czech Republic', category: "venue", tour: tour1 },
  { date: Date.new(2024, 5, 8), city: 'Amsterdam', cost: 240.00, state: 'Netherlands', category: "restaurant", tour: tour1 },
  { date: Date.new(2024, 5, 9), city: 'Zurich', cost: 200.25, state: 'Switzerland', category: "hotel", tour: tour1 }
])
