require 'sinatra/base'
require 'stripe'

class MyApp < Sinatra::Base
  set :publishable_key, ENV['STRIPE_PUBLISHABLE_KEY']
  set :secret_key, ENV['STRIPE_SECRET_KEY']
  set :products, {
    book: OpenStruct.new(amount: 3220, name: 'Informationstechnologie Grundlagen')
  }

  Stripe.api_key = settings.secret_key

  get '/' do
    redirect '/courses/01_intro_zahlensysteme'
  end

  get '/courses/:name' do |name|
    erb "courses/#{name}".to_sym
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