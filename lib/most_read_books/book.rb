class MostReadBooks::Book
  attr_accessor :name, :author, :rating, :people_read, :url, :description

  @@all = []


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


  def self.create_books(input)
    books_array = MostReadBooks::BookScraper.scrape_main_page
    @@all<<self.new(books_array[input.to_i-1][:name], books_array[input.to_i-1][:author], books_array[input.to_i-1][:rating], books_array[input.to_i-1][:people_read], books_array[input.to_i-1][:url]).uniq
  end

  def self.all
    @@all
  end

  def description
    # if the book already has a @book_description, return it
    # otherwise scrape the desciption and store it in @book_description
  end
end
