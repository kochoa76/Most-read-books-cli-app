class MostReadBooks::Book
 attr_accessor :name, :author, :rating, :people_read, :url

  def self.weeks_books
    #scrape goodreads and then return books based on that data
    self.scrape_books
  end

  def self.scrape_books
    books = []
    #go to goodreads,
    #find the product,
    #extract properties,
    #instantiate a book,
    file = "https://www.goodreads.com/book/most_read"
    doc = Nokogiri::HTML(open(file))
    binding.pry
    main_page = doc.css("div.leftContainer")

    book = self.new
    book.name = doc.css("a.bookTitle")[0].text.gsub("\n", "").strip
    book.author = doc.css("a.authorName")[0].text.gsub("\n", "").strip
    book.rating = doc.css("span.minirating")[0].text.gsub(" — 71,776 ratings", "")
    book.people_read = doc.css("span.greyText.statistic")[0].text.gsub(/\s+/, ' ')
    books<<book
end





end

#   book_1 = self.new
# book_1.name = "The Great Alone"
# book_1.author = "Kristin Hannah"
# book_1.rating = "4.35"
# book_1.people_read= "3,407"
# book_1.url = "https://www.goodreads.com/book/most_read"
