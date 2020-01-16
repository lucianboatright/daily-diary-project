require 'sinatra/base'

class DiaryManager < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/submit' do
    @title = params[:title]
    @body = params[:body]
    redirect '/confirm'
  end

  get '/confirm' do
    erb :confirm
  end


  run! if app_file == $0

end