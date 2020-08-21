# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning db"
Ingredient.destroy_all
puts "Cleaned db"

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
serialized_ingredients = RestClient.get(url)
ingredients = JSON.parse(serialized_ingredients)

# count = 0

# until count == 20 do
#   ingredient = ingredients["drinks"].sample.values.first
#   ingredient = Ingredient.new(name: ingredient)

#   if ingredient.valid?
#     ingredient.save
#     puts ingredient.name
#     count += 1
#   else
#   end
# end

# byebug

final_ingredients = ingredients["drinks"]
final_ingredients.each do |ingredient|
  Ingredient.create(name: ingredient.values)
end

puts "Done with #{final_ingredients.count} different ingredients :)"
