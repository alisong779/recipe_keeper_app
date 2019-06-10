5.times do 
  user = User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
  2.times do 
    user.recipes.create(name: Faker::Food.dish, ingredients: Faker::Food.description, instructions: Faker::Lorem.paragraph)
  end 
end 