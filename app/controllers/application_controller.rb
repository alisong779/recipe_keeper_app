require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    use Rack::Flash
  end

  get "/" do
    erb :welcome
  end
  
  helpers do 
    def current_user
      @user ||= User.find(session[:user_id])
    end 
  
    def logged_in?
      !!session[:user_id]
    end 
    
    def authorized_to_edit?(object)
      current_user.id == object.user_id
    end 
  end 

end
