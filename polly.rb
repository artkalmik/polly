require "sinatra"
require "json"
require "polly_phone"

configure do
  set :root, File.dirname(__FILE__)
  set :public_folder, "public/app"
end

def get_config
  PollyPhone::Site.new(File.dirname(__FILE__) + "/sites/config.yml")
end

get "/" do
  File.read("public/app/index.html")
end

get "/brands" do
  JSON brands: get_config.brands_list
end

get "/models" do
  JSON models: get_config.models(params[:brand]) || nil
end

get "/phones" do
  JSON desc: get_config.phone_desc(params[:phone_url])
end

get "/search" do
  JSON items: get_config.search(params[:item])
end
