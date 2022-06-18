# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Food.destroy_all

Food.create!([
  { name: 'momo', description: 'momo is momo!', price: 150 },
  { name: 'meat lover pizza', description: 'pizzaaaaaaaa', price: 450 },
  { name: 'Chicken Biryani', description: 'The best biryani in town is at Gurkha Grill.', price: 450 },
])
