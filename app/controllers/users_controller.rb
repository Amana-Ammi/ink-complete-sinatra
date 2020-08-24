class UserController < ApplicationController

   
    get '/users/signup' do 
        erb :'/users/signup'
    end 
   
    post '/users/signup' do 
        if params[:name] == "" && params[:email] == "" && params[:password] == ""
            redirect '/users/signup'
        else
            @user = User.create(
                name: params[:name],
                email: params[:email],
                password: params[:password]
            )
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    get '/users/login' do
        if logged_in?
            @user = User.find(session[:user_id])
            redirect "/users/#{@user.id}"
       else
            erb :'users/login'
       end
    end

    post '/users/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/users/login'
        end
    end

    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        if logged_in?
            if @user.id == current_user.id
            erb :'/users/show'
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect
            erb :'/'
        end
    end

    get '/users/:id/logout' do 
        session.clear
        redirect '/'
    end


end