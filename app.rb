require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    erb :index
  end
  
  get '/exercises.html' do
    send_file 'views/exercises.html'
  end

  get '/css/:folder/:file' do |folder, file|
    send_file "css/#{folder}/#{file}"
  end
  
  get '/css/:file' do |file|
    send_file "css/#{file}"
  end

  get '/images/:file' do |file|
    send_file "images/#{file}"
  end

  get '/files/:folder/:file' do |folder, file|
    send_file "files/#{folder}/#{file}"
  end

  get '/:file' do |file|
    send_file file if file.end_with?(".json")
  end
end