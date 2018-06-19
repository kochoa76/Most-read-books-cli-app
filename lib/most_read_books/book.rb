class MostReadBooks::Book
 attr_accessor :name, :author, :rating, :people_read, :url

  def self.weeks_books
    #scrape goodreads and then return books based on that data

  book_1 = self.new
  book_1.name = "The Great Alone"
  book_1.author = "Kristin Hannah"
  book_1.rating = "4.35"
  book_1.people_read= "3,407"
  book_1.url = "https://www.goodreads.com/book/most_read"

  book_2 = self.new
  book_2.name = "Little Fires Everywhere"
  book_2.author = "Celeste Ng"
  book_2.rating = "4.16"
  book_2.people_read= "2,694"
  book_2.url = "https://www.goodreads.com/book/most_read"

  [book_1 , book_2]
end


end
