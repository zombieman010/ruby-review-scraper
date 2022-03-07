require 'sinatra'
require 'json'
require './WebScraper'

before do
  content_type 'application/json'
end

post '/location' do
  begin
    request = json_params
    scrape = WebScraper.new
    result = scrape.getReview(request['location'])
    result.to_json
  rescue StandardError => e
    # TODO implement more custom exceptions
    if e.message != nil
      if e.message == "Unable to get review"
        return halt 404, { message: 'Unable to get review'}.to_json
      end
    end
    halt 500, { message: 'Unexpected exception'}.to_json
  end
end

def json_params
  begin
    JSON.parse(request.body.read)
  rescue
    halt 400, { message:'Invalid JSON' }.to_json
  end
end








