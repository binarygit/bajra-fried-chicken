# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bill.destroy_all
User.destroy_all
AccessLevel.destroy_all
Food.destroy_all
Table.destroy_all

AccessLevel.create!([ { name: 'admin' }, { name: 'ordinary' } ])

avi = { username: 'avi', password: 'avi', password_confirmation: 'avi', email: 'avi@avi.com' }
ava = { username: 'ava', password: 'ava', password_confirmation: 'ava', email: 'ava@ava.com' }
admin = { username: 'admin', password: 'admin', password_confirmation: 'admin', email: 'admin@admin.com' }

User.create!([ avi, ava, admin ])

Food.create!([
  { name: 'Chicken Momo', description: 'This is the best momo in town. kukhuri kaaa', price: 150 },
  { name: 'Mutton Momo', description: 'This is the best momo in town. Myyyaaaa', price: 350 },
  { name: 'Buff Momo', description: 'This is the best momo in town. Baaaaaaa', price: 100 },
  { name: "Meat lover's pizza", description: 'The pizza for those who love to eat meat!', price: 450 },
  { name: "Something is wrong pizza", description: 'The pizza for vegetarians.', price: 650 },
  { name: 'Chicken Biryani', description: 'The best biryani in town is at Gurkha Grill. Try it!', price: 490 },
  { name: 'Mutton Biryani', description: 'Only the chicken is nice. Try it!', price: 690 },
])

Table.create!([
  { name: 'The table of Eden', description: 'This is the first table ever made.' },
  { name: 'The table of Narnia', description: 'This is the table where Aslan died.'},
  { name: 'The table of Dumbledore', description: "This is Dumbledore's table."}
])

User.first.reservations.create!({
  table_id: Table.second.id,
  reserved_for: Date.today
})

User.second.reservations.create!([
  {
    table_id: Table.second.id,
    reserved_for: Date.tomorrow
  },
  {
    table_id: Table.third.id,
    reserved_for: Date.today
  }
])

bill_one = {
  'orders_attributes' => {
    0 => {
      food_id: Food.first.id,
      quantity: 1,
      total: 150 
    },
    1 => {
      food_id: Food.third.id,
      quantity: 3,
      total: Food.third.price * 3 
    }
  },
  total: 450,
  user_id: User.first.id
}

bill_two = {
  'orders_attributes' => {
    0 => {
      food_id: Food.second.id,
      quantity: 1,
      total: 350 
    },
    1 => {
      food_id: Food.third.id,
      quantity: 3,
      total: Food.third.price * 3 
    }
  },
  total: 650,
  user_id: User.first.id,
  paid: true
}

Bill.create!([bill_one, bill_two])
