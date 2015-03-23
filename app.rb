require 'sinatra'
require 'slim'
require 'data_mapper'



require './model'

module ChatApp
  class App < Sinatra::Base
    configure do
      enable :sessions
    end

    get '/' do
      slim :index
    end

    post '/signup' do
      if(params[:FullName])
        session[:FullName] = params[:FullName]
        redirect to('/hello/'+params[:FullName].gsub(' ','%20'))
      else
        redirect to('/')
      end
    end

    get '/hello/:FullName' do
      FullName = params[:FullName]
      slim :hello
    end

    post '/message' do
      if(params[:message])
        Messages.create(:poster => session[:Fullname], :text => params[:message])
      end
      redirect to('/hello/'+session[:FullName].gsub(' ','%20'))
    end
  end
end