class ClientsController < ApplicationController

    #create a client

    get '/clients/new' do 
        erb :'/clients/new'
    end

    post '/clients/new' do 
        @client = Client.create(
            first_name: params[:first_name],
        last_name: params[:last_name],
        design_description: params[:design_description],
        location: params[:location],
        price: params[:price],
        appt_date: params[:appt_date],
        appt_time: params[:appt_time],
        phone_number: params[:phone_number]
        )
        redirect '/clients'ß
    end


end