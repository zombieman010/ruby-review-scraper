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

 ## Error handling 
 Unexpected error => 500 INTERNAL SERVIER ERROR
 Parsing exception => 400 BAD REQUEST 
 Template exception => 404 NOT FOUND 

## Test Coverage 
Test coverage is a work in progress. Plan to implement Rspec test cases but ran out of time 
 
 

