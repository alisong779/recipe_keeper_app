class RecipesController < ApplicationController
  
  get '/recipes' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    end
    @recipes = Recipe.all
    @user = Helpers.current_user(session)
    erb :"/recipes/recipes"
  end

get '/recipes/create_recipe' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    end
    erb :"/recipes/create_recipe"
    end
    
  post '/recipes' do 
    @user = Helpers.current_user(session)
    if params[:name].empty?
      redirect to '/recipes/create_recipe'
    end
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], :user_id => @user.id)

    redirect to '/recipes'
  end 

end 