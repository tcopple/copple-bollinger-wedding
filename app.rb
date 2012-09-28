require 'rubygems'
require 'sinatra'
require 'thin'
require 'sass'
require 'haml'
require 'neat'

require_relative 'routes/coffee'
require_relative 'routes/sass'
require_relative 'routes/view'

before do
  content_type :html, 'charset' => 'utf-8'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

class Wedding < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :haml, { :format => :html5 }
  set :public_folder, root + '/public'

  use SassHandler
  use CoffeeHandler
  use ViewHandler
end
