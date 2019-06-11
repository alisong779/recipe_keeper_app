class RecipesController < ApplicationController
  
  get '/recipes/create_recipe' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    end
    erb :"/recipes/create_recipe"
    end

end 