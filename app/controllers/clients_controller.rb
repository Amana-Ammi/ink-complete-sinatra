class ClientsController < ApplicationController

    #create a client
    get '/clients/new' do 
        if logged_in?
            erb :'/clients/new'
        else
            erb :welcome
        end
    end

    #Prevent Bad Data
    post '/clients/new' do 
        if !logged_in?
            redirect '/'
        end
        if params == ""
            redirect '/clients/new'
        else
            @client = Client.create(
                first_name: params[:first_name],
                last_name: params[:last_name],
                description: params[:description],
                location: params[:location],
                price: params[:price],
                appt_date: params[:appt_date],
                user_id: current_user.id
                )
            redirect "/clients/#{@client.id}"

        end
    end

    get '/clients/:id' do 
        find_client
        if logged_in?
            if @client.user == current_user
                erb :'/clients/show'
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    get '/clients/:id/edit' do
        find_client
        if logged_in?
            if @client.user == current_user
            erb :'/clients/edit'
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/clients/:id' do
        find_client
    #can edit with bad data :/
        #ActiveRecord Method of update
        if params != ""
            @client.update(
                first_name: params[:first_name],
                last_name: params[:last_name],
                description: params[:description],
                location: params[:location],
                price: params[:price],
                appt_date: params[:appt_date],
            )
            redirect "/clients/#{@client.id}"
        else
            redirect "/clients"
        end
    end
 
    get '/clients' do
        if logged_in?
            @clients = Client.all
            erb :'/clients/index'
        else
            erb :welcome
        end
    end

    delete '/clients/:id' do 
        find_client
        if authorized?(@client)
            @client.destroy
            redirect '/clients'
        else
            #user show page
            redirect "/users/#{current_user.id}"
        end
    end

    private  

    def find_client
        @client = Client.find(params[:id])
    end        

end