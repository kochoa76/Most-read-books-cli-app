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
    main_page = Nokogiri::HTML(open(BASE_PATH + "/book/most_read"))

    @books_array =[]
    main_page.css("table.tableList").each do |table|
    table.css("tr").each do |s|
    book = self.new
    book.name = s.css("a.bookTitle span").children.text
    book.author = s.css("a.authorName").text
    book.rating = s.css("span.minirating").text.gsub(" — ", " with ")
    book.people_read = s.css("span.greyText.statistic").text.gsub(/\s+/, ' ')
    book.url = s.css("a.bookTitle").attr("href").value

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
    @book_description = self.scrape_book_page(BASE_PATH + self.all[input.to_i-1].url)
  end

  def self.scrape_book_page(book_url)
    book_page = Nokogiri::HTML(open(book_url))
    book = MostReadBooks::Book.new
    book.description = book_page.css("div#description span")[1].text.strip
  end
end
