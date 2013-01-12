require 'rubygems'
require 'sinatra'
require 'thin'
require 'sass'
require 'haml'
require 'neat'
require 'sinatra/assetpack'

before do
  content_type :html, 'charset' => 'utf-8'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

class  AppHandler < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :haml, { :format => :html5 }
  set :public_folder, "#{root}/public"
  set :scss, { load_paths: ["#{AppHandler.root}/assets/stylesheets"] }

  register Sinatra::AssetPack
  assets {
    serve '/assets/js', from: 'assets/javascripts'
    serve '/assets/css', from: 'assets/stylesheets'
    serve '/assets/images', from: 'public/images'

    css :app, ["/assets/css/app.css"]
  }

  get "/content/*" do
    filename = "#{@root}/partials/_#{params[:splat].first}"
    found = !(filename.nil? || filename.empty? || filename == '/' )

    content_type :html, 'charset' => 'utf-8'
    found ? haml(filename.to_sym, :layout => false) : "No content found for this section."
  end

  get '/' do
    content_type :html, 'charset' => 'utf-8'
    haml :index
  end
end
