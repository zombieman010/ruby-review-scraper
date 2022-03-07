# ruby-review-scraper

## Run information
run => ruby ReviewService.rb

## Build Information 
Programmed in: Ruby
RestServer: Sinatra
Scraper: Nokogiri

## Supported templates
Currently only taking requests for https://www.productreview.com.au/listings/<review>

## Endpoint 
POST Request
 - host/location

Body (JSON)
 - attribute name => location (full url) 

Response 
JSON array with object: 
```json 
{
  "title": "a title", 
  "body": "review body", 
  "author": "an author", 
  "rating": 0, 
  "date": "a date" (date format yyyy-MM-DD'T'HH:mm:ss)
}
```


## Test Coverage 
Test coverage is a work in progress. Plan to implement Rspec test cases but ran out of time 

