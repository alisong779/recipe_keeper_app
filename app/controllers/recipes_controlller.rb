class RecipesController < ApplicationController
  
  get '/recipes' do
    if !logged_in?
      redirect to '/login'
    end
    @user = current_user
    @recipes = @user.recipes 
    erb :"/recipes/recipes"
  end

get '/recipes/create_recipe' do
    if !logged_in?
      redirect to '/login'
    end
    erb :"/recipes/create_recipe"
    end
    
  post '/recipes' do 
    @user = current_user
    if params[:name].empty?
      redirect to '/recipes/create_recipe'
    end
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], :user_id => @user.id)

    redirect to '/recipes'
  end 
end 