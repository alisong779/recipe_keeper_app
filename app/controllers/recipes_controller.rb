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
      @recipe = @user.recipes.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], notes: params[:notes])
    redirect to '/recipes'
  end 
  
  get '/recipes/:id' do
    if !logged_in?
      redirect to '/login'
    end
    @recipe = Recipe.find(params[:id])
    erb :"recipes/show"
  end
  
  get '/recipes/:id/edit' do
    if !logged_in?
      redirect to '/login'
    end
    @recipe = Recipe.find(params[:id])
    if !authorized_to_edit?(@recipe)
      redirect to '/recipes'
    end
    erb :"recipes/edit_recipe"
  end
  
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    if !authorized_to_edit?(@recipe)
      redirect to '/recipes'
    end
    if params[:name].empty?
      redirect to "/recipes/#{params[:id]}/edit"
    end
    recipe.update(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions], notes: params[:notes])
 
    redirect to "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id/delete' do 
    if !logged_in?
      redirect to '/login'
    end
    @recipe = Recipe.find(params[:id])
    if !authorized_to_edit?(@recipe)
      redirect to '/recipes'
    else
      @recipe.delete
      redirect to '/recipes'
    end 
  end 

end 