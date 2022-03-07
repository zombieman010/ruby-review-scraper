require 'sinatra'
require 'json'
require_relative 'service/web_scraper'

before do
  content_type 'application/json'
end

post '/location' do
  request = json_params
  scrape = WebScraper.new
  result = scrape.getReview(request['location'])
  result.to_json
rescue UnhandledTemplateException => e
  halt 404, { message: e.message }.to_json
rescue StandardError
  halt 500, { message: 'Unexpected exception' }.to_json
end

def json_params
  JSON.parse(request.body.read)
rescue StandardError
  halt 400, { message: 'Invalid JSON' }.to_json
end
