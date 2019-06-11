class UsersController < ApplicationController
  
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/recipes'
    end

    erb :"/users/create_user"
  end
  
  post '/signup' do
    if (params[:username]).empty? || (params[:email]).empty? || (params[:password]).empty?
      redirect to '/signup'
    end


    user = User.create(:username => params["username"], :email => params["email"], :password => params["password"])
    session[:user_id] = user.id

    erb :'users/profile'
  end
  
  get '/profile' do 
    erb :'users/profile'
  end 
 
end 
