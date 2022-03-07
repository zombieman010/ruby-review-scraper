require 'watir'
require 'webdrivers'
require 'nokogiri'
require 'json'
require './ReviewBuilder'

class WebScraper
  def getReview(url)
    begin
      #get webpage and parse
      browser = Watir::Browser.new :chrome, headless: true
      browser.goto(url)
      parsed_page = Nokogiri::HTML(browser.html)

      # using json data for simplicity and time
      # would parse html if no json data is present
      jsons = parsed_page.search('script[type="application/ld+json"]').map{|s| JSON.parse(s.content)}

      #find review and return
      reviews = []
      jsons.first()['review'].each do |rev|
        single = ReviewBuilder.new(rev['headline'], rev['reviewBody'], rev['author']['name'],rev['reviewRating']['ratingValue'], rev['datePublished'])
        reviews.push(single.to_json)
      end

      browser.close
      return reviews
    rescue
      browser.close
      raise StandardError.new("Unable to get review")
    end
  end
end





