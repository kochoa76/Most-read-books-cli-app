class MostReadBooks::BookScraper

  def self.scrape_main_page
    main_page = Nokogiri::HTML(open("https://www.goodreads.com/book/most_read"))


    books_array =[]
    book = MostReadBooks::Book.new
    book.name = main_page.css("table.tableList").css("tr").css("a.bookTitle span").children.text
    book.author =main_page.css("table.tableList").css("tr").css("a.authorName").text
    book.rating = main_page.css("table.tableList").css("tr").css("span.minirating").text.gsub(" — ", " with ")
    book.people_read = main_page.css("table.tableList").css("tr").css("span.greyText.statistic").text.gsub(/\s+/, ' ')
    book.url = main_page.css("tr a.bookTitle").attr("href")


    main_page.css("table.tableList").each do |table|
    table.css("tr").each do |s|
    book = MostReadBooks::Book.new
    book.name = s.css("a.bookTitle span").children.text
    book.author = s.css("a.authorName").text
    book.rating = s.css("span.minirating").text.gsub(" — ", " with ")
    book.people_read = s.css("span.greyText.statistic").text.gsub(/\s+/, ' ')
    book.url = main_page.css("tr a.bookTitle").attr("href").value

    books_array << book


  end
end

books_array
end

# main_page.css("table.tableList").each do |table|
#    table.css("tr").each do |book|
#    book_name = book.css("a.bookTitle span").children.text
#    book_author = book.css("a.authorName").text
#    book_rating = book.css("span.minirating").text.gsub(" — ", " with ")
#    book_people_read = book.css("span.greyText.statistic").text.gsub(/\s+/, ' ')
#    book_page = "#{book.attr('href')}"
#
#    books_array<< {name: book_name, author: book_author, rating: book_rating, people_read: book_people_read, book_url: book_page}
#      end
#    end
#    books_array
#  end


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
