ENV['APP_ENV'] = 'test'

require './app/controller'
require 'rspec'
require 'rack/test'

RSpec.describe 'Sanitra Controller' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "returns a successful response" do
    WebScraper.any_instance.stub(:getReview).and_return([{title: "title"}])
    post '/location', { location: "http://test.com" }.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq([{title: "title"}].to_json)
  end

  it "returns a bad request" do
    post '/location', "CONTENT_TYPE" => "application/json"
    expect(last_response.status).to eq(400)
    expect(last_response.body).to eq({message: 'Invalid JSON'}.to_json)
  end

  it "returns a not found response" do
    WebScraper.any_instance.stub(:getReview).and_raise(UnhandledTemplateException.new('Unhandled template'))
    post '/location', { location: "http://test.com" }.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response.status).to eq(404)
    expect(last_response.body).to eq({message: 'Unhandled template'}.to_json)
  end

  it "returns standard unhandled exception" do
    WebScraper.any_instance.stub(:getReview).and_raise(StandardError.new)
    post '/location', { location: "http://test.com" }.to_json, "CONTENT_TYPE" => "application/json"
    expect(last_response.status).to eq(500)
    expect(last_response.body).to eq({message: 'Unexpected exception'}.to_json)
  end
end


