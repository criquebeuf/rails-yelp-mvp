require 'faker'

5.times do
  restaurant = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.city, category: ["chinese", "italian", "japanese", "french", "belgian"].sample )
  restaurant.save
end
