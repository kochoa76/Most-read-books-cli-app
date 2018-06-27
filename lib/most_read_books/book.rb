class MostReadBooks::Book
  attr_accessor :name, :author, :rating, :people_read, :url, :description
  BASE_PATH = "https://www.goodreads.com"
  @@all = []
  # @@books_array = MostReadBooks::BookScraper.scrape_main_page



  # def initialize(book_hash)
  #  book_hash.each do |accessor, value|
  #     self.send("#{accessor}=", value)
  #     @@all<<self
  #   end
  # end

  # def initialize(book_hash)
  #  book_hash.each do |accessor, value|
  #     self.send("#{accessor}=", value)
  #     @@all<<self
  #   end
  # end

  def initialize
    @name = name
    @author= author
    @rating= rating
    @people_read= people_read
    @url = url
  end
#
#   def self.create_books
#       @books_array = MostReadBooks::BookScraper.scrape_main_page
#
#       @books_array.each do |book,i|
#         self.new(book[i][:name], book[i][:author], book[i][:rating], book[i][:people_read], book[i][:url])
#
# end
# end

  def self.list_all_books
  MostReadBooks::BookScraper.scrape_main_page


  # def self.create_books(input)
  #   @books_array = MostReadBooks::BookScraper.scrape_main_page
  #   @new_books =[]
  #   @new_books<<self.new(@books_array[input.to_i-1][:name], @books_array[input.to_i-1][:author], @books_array[input.to_i-1][:rating], @books_array[input.to_i-1][:people_read], @books_array[input.to_i-1][:url])
  # end
end

  def self.all
    @@all<<self.list_all_books.uniq 
  end

  def self.choose_book(input)
    #book_description = MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + book.url)
    @@urls_array = MostReadBooks::BookScraper.scrape_all_book_urls(BASE_PATH + "/book/most_read")
    book_description = MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + @@urls_array[input.to_i-1] )
  end

  # def choose_book(input) #selects one book from list, scrapes it and puts out it's description
  #    add_book_description(input)
  # end








  # def choose_book(book) #selects one book from list, scrapes it and puts out it's description
  #
  #   book_description = MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + book.url)
  # end
  #
  # def description(book)
  #   if book.include?(book.description)
  #     book.description
  #   else
  #     MostReadBooks::BookScraper.scrape_book_page(book.url)
  #   # if the book already has a @book_description, return it
  #   # otherwise scrape the desciption and store it in @book_description
  # end

  # def add_description(index) #scrapes book page and adds book description to appropriate book
  #     #@urls_array = MostReadBooks::BookScraper.scrape_all_book_urls(BASE_PATH + "/book/most_read")
  #
  #     book_description= MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + @urls_array[index] )
  #     binding.pry
  #     # book.book_description = @book_description_array
  #     #MostReadBooks::Book.add_book_description(book_description)
  #     #book.MostReadBooks::BookScraper.add_book_description(description)
  # end

# def add_description #scrapes book page and adds book description to appropriate book
#   MostReadBooks::Book.all.each do |book|
#     @book_description_array = MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + book.book_url)
#     # book.book_description = @book_description_array
#     book.add_book_description(@book_description_array)
#     #book.MostReadBooks::BookScraper.add_book_description(description)
#   end
# end

end
