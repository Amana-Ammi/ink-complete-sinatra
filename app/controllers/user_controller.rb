class UserController < ApplicationController

    #Renders sign up form
    get '/users/signup' do 
        erb :'/users/signup'
    end 
   
    #creates the user, logs them in/starts session,
    #redirect to user homepage
    post '/users/signup' do 
        @user = User.create(
            name: params[:name],
            email: params[:email],
            password: params[:password]
        )
        session[:user_id] = @user.id
        binding.pry
        redirect "/users/#{@user.id}"
    end

    #Renders login form
    get '/users/login' do 
       erb :'users/login'
    end 

    #Logs user in/session, Authenticate user
    post '/users/login' do 
    end 

end