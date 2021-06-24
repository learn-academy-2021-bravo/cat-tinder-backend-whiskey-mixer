# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
whiskey = [
    {
        name: "Jeffersons 17 year Presidential Select",
        country:'US',
        age: "17 years",
        notes: "Coconut, roasted nuts, and nougat"
    },

    {
        name:"Kavalan single malt Whiskey",
        country:"Taiwan",
        age:"2 years",
        notes:"Honey, tropical fruits, pear drop, vanilla, chocolate"

    },
    {
        name:"Green Spot Still",
        country:"Ireland",
        age:"8 years",
        notes:"Cinnamon, vanilla, brown sugar, weathered fruits"
    }
]
whiskey.each do |attributes|
  Whiskey.create attributes
  puts "creating whiskey #{attributes}"
end