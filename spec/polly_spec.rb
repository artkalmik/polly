require File.expand_path '../spec_helper.rb', __FILE__
require "./polly.rb"

describe "Polly" do

  def app
    Sinatra::Application
  end

  it "should allow accessing the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should get brands" do
    get '/brands'
    resp = JSON.parse(last_response.body)
    expect(resp["brands"].count).to be > 1
  end

  it "should get models" do
    get '/models', :brand => "Samsung"
    resp = JSON.parse(last_response.body)
    expect(resp["models"].count).to be > 100
  end

  it "should search phone" do
    get '/search', :item => "iphone"
    resp = JSON.parse(last_response.body)
    expect(resp["items"].count).to be > 10
  end

end