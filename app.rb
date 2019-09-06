require 'sinatra/base'
require 'stripe'

class MyApp < Sinatra::Base
  set :publishable_key, ENV['STRIPE_PUBLISHABLE_KEY']
  set :secret_key, ENV['STRIPE_SECRET_KEY']
  set :products, {
    book: OpenStruct.new(amount: 3220, name: 'Informationstechnologie Grundlagen')
  }

  enable :method_override

  Stripe.api_key = settings.secret_key

  set :PAGE_NAMES, {
    '01_intro_zahlensysteme' => 'Einführung & Zahlensysteme',
    '02_hardware' => 'Hardware',
    '03_digilog_betriebssysteme' => 'Digitale Schaltungen & Betriebssysteme',
    '045_php' => 'PHP',
    '04_programmieren' => 'Programmieren',
    '05_datenbanken' => 'Datenbanken',
    '06_netzwerke' => 'Netzwerke',
    '07_webprojekt' => 'Web-Projekt',
    '50_bpi' => 'BPI'
  }

  get '/' do
    redirect '/courses/01_intro_zahlensysteme'
  end

  get '/formtest1' do
    [200, "Resultate für #{params[:search_term]}"]
  end

  post '/formtest2' do
    if params[:password] == "asdfasdf"
      [200, "Willkommen #{params[:username]}"]
    else
      [403, "Falsches Passwort"]
    end
  end

  ########################################################

  get '/todos' do
    @@todos ||= []
    @todos = @@todos.sort_by(&:id)
    erb "todos/index".to_sym, layout: :simple
  end

  get '/todos/:id' do |id|
    @@todos ||= []
    @todo = @@todos.find { |todo| todo.id.to_i == id.to_i }
    if @todo.nil?
      status 404
    end
    erb "todos/show".to_sym, layout: :simple
  end

  post '/todos' do
    @@todos ||= []
    @todo = OpenStruct.new(id: rand(9999), text: params[:text])
    @@todos << @todo
    erb "todos/show".to_sym, layout: :simple
  end

  put '/todos/:id' do |id|
    @@todos ||= []
    @todo = OpenStruct.new(id: id, text: params[:text])
    old_todo = @@todos.find { |todo| todo.id.to_i == id.to_i }
    idx = @@todos.index(old_todo)
    @@todos[idx] = @todo
    @todos = @@todos
    erb "todos/show".to_sym, layout: :simple
  end

  delete '/todos/:id' do |id|
    @@todos ||= []
    old_todo = @@todos.find { |todo| todo.id.to_i == id.to_i }
    idx = @@todos.index(old_todo)
    @@todos.delete_at(idx)
    [201, "Deleted"]
  end

  ########################################################

  get '/courses/:name' do |name|
    @page = name
    erb "courses/#{name}".to_sym
  end

  get '/exercises/*' do |file|
    send_file "exercises/#{params[:splat].first}"
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

  get '/files/:file' do |file|
    send_file "files/#{file}"
  end

  get '/:file' do |file|
    send_file file if file.end_with?(".json")
  end

  post '/payment/:product_name' do |product_name|
    product = settings.products[product_name.to_sym]

    @amount = product.amount

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :amount      => @amount,
      :description => product.name,
      :currency    => 'chf',
      :customer    => customer.id,
      :receipt_email => params[:stripeEmail]
    )

    erb :payment_ok
  end

  error Stripe::CardError do
    env['sinatra.error'].message
  end
end