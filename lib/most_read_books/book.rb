class MostReadBooks::Book
  attr_accessor :name, :author, :rating, :people_read, :url, :description
  BASE_PATH = "https://www.goodreads.com"


  def initialize(name = nil, author =nil, rating = nil, people_read =nil)
      @name = name
      @author = author
      @rating = rating
      @people_read = people_read
  end


  def self.list_all_books
    # MostReadBooks::BookScraper.scrape_main_page
    main_page = Nokogiri::HTML(open(BASE_PATH + "/book/most_read"))

    @books_array =[]
    main_page.css("table.tableList").each do |table|
    table.css("tr").each do |s|
    book = self.new
    book.name = s.css("a.bookTitle span").children.text
    book.author = s.css("a.authorName").text
    book.rating = s.css("span.minirating").text.gsub(" — ", " with ")
    book.people_read = s.css("span.greyText.statistic").text.gsub(/\s+/, ' ')
    book.url = main_page.css("tr a.bookTitle").attr("href").value

    @books_array << book

  end
end

  @books_array
end

  def self.find_name(input)
    @books_array[input.to_i-1].name 
  end


  def self.all
    @@all ||= list_all_books
  end

  def self.choose_book(input)
    #book_description = MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + book.url)
    @@urls_array = self.scrape_all_book_urls(BASE_PATH + "/book/most_read")
    @book_description = self.scrape_book_page(BASE_PATH + @@urls_array[input.to_i-1] )
  end

  def self.scrape_all_book_urls(url)
    urls_array = []
    main_page = Nokogiri::HTML(open(url))
    main_page.css("tr a.bookTitle").find_all do |url|
      urls_array<< url.attr("href")
    end
    urls_array
  end

  def self.scrape_book_page(book_url)
    book_page = Nokogiri::HTML(open(book_url))
    book = MostReadBooks::Book.new
    book.description = book_page.css("div#description span")[1].text.strip
  end
end
