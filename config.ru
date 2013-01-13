path = ::File.dirname(__FILE__)
puts path
require ::File.join(path, "app")

run AppHandler
