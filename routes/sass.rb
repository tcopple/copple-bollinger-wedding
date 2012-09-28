class SassHandler < Sinatra::Base
  set :root, "#{File.dirname(__FILE__)}/.."
  set :views, "#{root}/templates/scss"

  get '/assets/stylesheets/*.css' do
    require './templates/scss/bourbon/lib/bourbon.rb'
    filename = params[:splat].first

    content_type 'text/css', :charset => 'utf-8'
    scss filename.to_sym
  end
end
