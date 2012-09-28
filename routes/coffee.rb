class CoffeeHandler < Sinatra::Base
  set :root, "#{File.dirname(__FILE__)}/.."
  set :views, "#{root}/templates/coffee"

  get "/assets/javascripts/*.js" do
    filename = params[:splat].first

    content_type 'text/javascript', :charset => 'utf-8'
    coffee filename.to_sym, :layout => false
  end
end
