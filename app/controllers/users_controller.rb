class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect to '/profile'
    end

    erb :"/users/create_user"
  end
  
  post '/signup' do
    if (params[:username]).empty? || (params[:email]).empty? || (params[:password]).empty?
      flash[:field_error] = "All fields are required."
      redirect to '/signup'
    end
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = @user.id

    erb :'users/profile'
  end
  
  get '/login' do
    if logged_in?
      redirect to '/profile'
    end
      erb :"/users/login"
    end 

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/profile"
    elsif (params[:username]).empty? || (params[:password]).empty?
      flash[:field_error] = "All fields are required."
      redirect "/login"
    end
  end

  get '/profile' do 
    if logged_in?
      @user = current_user
      erb :'users/profile'
    end 
  end 
 
 get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end
end 
