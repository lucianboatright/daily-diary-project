require 'sinatra/base'

class Diary < Sinatra::Base

  get '/' do
    'HELLO'
  end


  run! if app_file == $0

end