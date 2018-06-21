class MostReadBooks::Book
 attr_accessor :name, :author, :rating, :people_read, :url

  def self.weeks_books
    #scrape goodreads and then return books based on that data
    self.scrape_books
  end

  def self.new_from_page
    #go to goodreads,
    #find the product,
    #extract properties,
    #instantiate a book,

    books =[]

    book = self.new
    properties = BookScraper.new(url)
    properties.each do |k, v|
      book.send("#{k}=", v)
    end
    book
  end





end







#   book_1 = self.new
# book_1.name = "The Great Alone"
# book_1.author = "Kristin Hannah"
# book_1.rating = "4.35"
# book_1.people_read= "3,407"
# book_1.url = "https://www.goodreads.com/book/most_read"
