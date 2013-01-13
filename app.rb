require 'rubygems'
require 'shotgun'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'thin'
require 'sass'
require 'haml'
require 'neat'

before do
  content_type :html, 'charset' => 'utf-8'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

class AppHandler < Sinatra::Base
  register Sinatra::AssetPack

  set :root, File.dirname(__FILE__)
  set :haml, { :format => :html5 }
  set :public_folder, "#{root}/public"
  set :scss, { load_paths: ["#{AppHandler.root}/assets/stylesheets"] }

  assets {
    serve '/assets/js', from: 'assets/javascripts'
    serve '/assets/css', from: 'assets/stylesheets'
    serve '/assets/images', from: 'public/images'

    css :globals, ["/assets/css/globals.css"]
    css :navigation, ["/assets/css/navigation.css"]
    css :header, ["/assets/css/header.css"]
    css :footer, ["/assets/css/footer.css"]
    css :content, ["/assets/css/content.css"]

    js :slider, ["/assets/js/slider.js"]
  }

  get "/content/*" do
    filename = "#{@root}/partials/_#{params[:splat].first}"
    found = !(filename.nil? || filename.empty? || filename == '/' )

    content_type :html, 'charset' => 'utf-8'
    found ? haml(filename.to_sym, :layout => true) : "No content found for this section."
  end

  get '/' do
    redirect '/content/home'
  end
end
