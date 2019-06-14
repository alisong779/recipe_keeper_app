class CategoriesController < ApplicationController
  get '/categories' do
    @category = Category.all
    erb :'/category/index'
  end

end 