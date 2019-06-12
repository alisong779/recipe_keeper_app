class UsersController < ApplicationController
  
  get '/signup' do
    if Helpers.is_logged_in?(session)
      redirect to '/profile'
    end

    erb :"/users/create_user"
  end
  
  post '/signup' do
    if (params[:username]).empty? || (params[:email]).empty? || (params[:password]).empty?
      redirect to '/signup'
    end


    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id

    erb :'users/profile'
  end
  
  get '/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/profile'
    end
      erb :"/users/login"
    end 

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/profile"
    else
      redirect "/login"
    end
  end

  get '/profile' do 
    erb :'users/profile'
  end 
 
 get '/logout' do
    if Helpers.is_logged_in?(session)
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end

  
end 
