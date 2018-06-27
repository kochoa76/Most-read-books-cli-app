class MostReadBooks::Book
  attr_accessor :name, :author, :rating, :people_read, :url, :description

  @@all = []
  # @@books_array = MostReadBooks::BookScraper.scrape_main_page


  #
  # def initialize(book_hash)
  #  book_hash.each do |accessor, value|
  #     self.send("#{accessor}=", value)
  #     @@all<<self
  #   end
  # end

  def initialize(name, author, rating, people_read, url)
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

  def self.create_books(input)
    @books_array = MostReadBooks::BookScraper.scrape_main_page
    @new_books =[]
    @new_books<<self.new(@books_array[input.to_i-1][:name], @books_array[input.to_i-1][:author], @books_array[input.to_i-1][:rating], @books_array[input.to_i-1][:people_read], @books_array[input.to_i-1][:url])
  end

  def self.all
    @@all<<@new_books.uniq 
  end

  def description
    # if the book already has a @book_description, return it
    # otherwise scrape the desciption and store it in @book_description
  end
end
