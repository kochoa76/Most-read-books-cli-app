class MostReadBooks::Book
  attr_accessor :name, :author, :rating, :people_read, :url, :description
  BASE_PATH = "https://www.goodreads.com"

  def initialize(name: nil, author: nil, rating: nil, people_read: nil, url: nil, description: nil)
      @name = name
      @author = author
      @rating = rating
      @people_read = people_read
      @url = url
      @description = description
  end

  def self.create_from_collection(books_array)
    books_array.collect do |book_hash|
     self.new(book_hash)
    end
  end

  def self.find_name(input)
    all[input.to_i-1].name
  end

  def self.all
    @@all ||= MostReadBooks::Scraper.scrape_book_list
  end

  def self.choose_book(input)
    book_description = MostReadBooks::Scraper.scrape_book_url(BASE_PATH + all[input.to_i-1].url)
  end
end
