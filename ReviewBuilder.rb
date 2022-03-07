#TODO implement more data for results

class ReviewBuilder
  attr_reader :title, :body, :author, :rating, :date
  
  def initialize(title, body, author, rating, date)
    @title = title
    @body = body
    @author = author
    @rating = rating
    @date = date
  end

  def to_json(*)
    {
      "title": @title,
      "body": @body,
      "author": @author,
      "rating": @rating,
      "date": @date
    }
  end
end
