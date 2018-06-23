class MostReadBooks::BookScraper
  def self.scrape_main_page(main_url)
    #main_url = "https://www.goodreads.com/book/most_read"
    main_page = Nokogiri::HTML(open(main_url))

    books = []
    #main_page = main_page.css("table.tableList")
    #main_page.css("tr")
    #book_page = book.css("a.bookTitle").attribute("href")
    #main_page.css("table.tableList").each do |table|

    main_page.css("table.tableList").each do |table|
    table.css("tr").each do |book|
    book_name = book.css("a.bookTitle span").children.text
    book_author = book.css("a.authorName").text
    book_rating = book.css("span.minirating").text.gsub(" — ", " with ")
    book_people_read = book.css("span.greyText.statistic").text.gsub(/\s+/, ' ')
    book_page = main_page.css("tr a").attr('href')

    books<< {name: book_name, author: book_author, rating: book_rating, people_read: book_people_read, book_url: book_page}
      end
    end
    books
  end

  def self.scrape_all_book_urls(url)
    urls_array = []
    #main_url= "https://www.goodreads.com/book/most_read"
    main_page = Nokogiri::HTML(open(url))

    main_page.css("tr a.bookTitle").find_all do |url|
      urls_array<< url.attr("href")
  end
  urls_array
end


  def self.scrape_book_page(book_url)
    #book_url = "https://www.goodreads.com/book/show/34912895-the-great-alone"
    book_page = Nokogiri::HTML(open(book_url))
    #book_description = book_page.css("div#descriptionContainer").children.text
    book_description = book_page.css("div#description span")[1].text.strip
  end

end
