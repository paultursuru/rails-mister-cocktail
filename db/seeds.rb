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

10.times do
  cocktail_name = Faker::Creature::Horse.breed
  cocktail = Cocktail.new(name: cocktail_name)
  file = URI.open("https://source.unsplash.com/300x200/?#{cocktail_name}")
  puts file
  cocktail.photo.attach(io: file, filename: "some-image.jpg", content_type: 'image/jpg')
  cocktail.save
  puts "cocktails ok"
  rand(2..5).times do
    dose_name = "#{rand(1..3)} parts"
    Dose.create(description: dose_name, cocktail: cocktail, ingredient: Ingredient.all.sample)
  end
end
