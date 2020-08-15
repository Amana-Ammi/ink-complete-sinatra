class ClientsController < ApplicationController

    #create a client
    get '/clients/new' do 
        erb :'/clients/new'
    end

    post '/clients/new' do 
        if !logged_in?
            redirect '/'
        end
        if params != ""
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
        else
            redirect '/clients/new'
        end
    end

    get '/clients/:id' do 
        @client = Client.find(params[:id])
        erb :'/clients/show'
    end

    post '/clients' do 
        @clients = Client.all
        erb :'/clients/index'
    end

end