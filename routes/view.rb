class ViewHandler < Sinatra::Base
  set :root, "#{File.dirname(__FILE__)}/.."
  set :views, "#{root}/views"

  get "*" do
    filename = params[:splat].first
    found = !(filename.nil? || filename.empty? || filename == '/' )
    haml (found ? filename.to_sym : :index)
  end
end
