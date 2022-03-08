# ruby-review-scraper

## Run information
run => ruby controller.rb

## Build Information 
- Programmed in: Ruby
- RestServer: Sinatra
- Scraper: Nokogiri

## Supported templates
Currently only taking requests for https://www.productreview.com.au/listings/<review>

## Endpoint 
POST Request
 - {host} /location

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
- Unexpected error => 500 INTERNAL SERVER ERROR
- Parsing exception => 400 BAD REQUEST 
- Template exception => 404 NOT FOUND 

## Test Coverage 
Ruby tests written with Rspec  
 
 

