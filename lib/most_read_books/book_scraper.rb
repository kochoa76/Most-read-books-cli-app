class BookScraper
  def initialize(url)

    book = {}
    url = "https://www.goodreads.com/book/most_read"
    doc = Nokogiri::HTML(open(url))
    main_page = doc.css("div.leftContainer")

    book[:name] = doc.css("a.bookTitle")[0].text.gsub("\n", "").strip
    book[:author] = doc.css("a.authorName")[0].text.gsub("\n", "").strip
    book[:rating] = doc.css("span.minirating")[0].text.gsub(" — ", " with ")
    book[:people_read] = doc.css("span.greyText.statistic")[0].text.gsub(/\s+/, ' ')

    book

  end 
end
