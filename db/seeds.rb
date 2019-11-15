# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# Cocktail.create(name: "Le José")
# Cocktail.create(name: "Le Philippe")
# Cocktail.create(name: "Le Bon Cocktail")

# Dose.create(description: "1 cup")
# Dose.create(description: "2 spoons")
# Dose.create(description: "3 dashes")
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

require 'json'
require 'open-uri'
require 'faker'


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
puts "ok url"
ingredients["drinks"].each do |i|
  Ingredient.create(name: i["strIngredient1"])
end

20.times do
  cocktail_name = Faker::Creature::Horse.breed
  cocktail = Cocktail.create(name: cocktail_name)
  puts "cocktails ok"
  rand(2..6).times do
    dose_name = "#{rand(1..5)} parts"
    Dose.create(description: dose_name, cocktail: cocktail, ingredient: Ingredient.all.sample)
  end
end
