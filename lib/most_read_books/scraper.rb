class MostReadBooks::Scraper
BASE_PATH = "https://www.goodreads.com"
  def self.scrape_book_list
    main_page = Nokogiri::HTML(open(BASE_PATH + "/book/most_read"))
    book_hashes = []
    main_page.css("table.tableList").each do |table|
      table.css("tr").each do |s|
        hash = {}
        hash[:name] = s.css("a.bookTitle span").children.text
        hash[:author] = s.css("a.authorName").text
        hash[:rating] = s.css("span.minirating").text.gsub(" — ", " with ")
        hash[:people_read] = s.css("span.greyText.statistic").text.gsub(/\s+/, ' ')
        hash[:url] = s.css("a.bookTitle").attr("href").value

        book_hashes << hash
      end
    end
   MostReadBooks::Book.create_from_collection(book_hashes)
  end

  def self.scrape_book_url(book_url)
    book_page = Nokogiri::HTML(open(book_url))
    book_description = book_page.css("div#description span")[1].text.strip
  end
end
