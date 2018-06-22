class MostReadBooks::CLI
BASE_PATH = "https://www.goodreads.com/book/"

  def call
    make_books
    list_books
    menu
    goodbye
  end

  def make_books
    @books_array = MostReadBooks::BookScraper.scrape_main_page(BASE_PATH + "most_read")
    MostReadBooks::Book.create_from_collection(@books_array)
  end

  def list_books
  puts "Most Read Books This Week:"
    @books_array.each.with_index(1) do |book, i|
      book_name = book[:name]
      book_author = book[:author]
      book_rating = book[:rating]
      book_people_read = book[:people_read]
      puts "#{i}. #{book_name} - #{book_author} - #{book_rating} - #{book_people_read}"
    end
  end

  def choose_book
    MostReadBooks::BookScraper.view_book_info(book_url)


  def menu
    input =nil
    while input != "exit"
    puts "Enter the number of the book you would like more info on, or type list to see the list of books again, or type exit"
    input = gets.strip.downcase

    if input.to_i > 0
      MostReadBooks:BookScraper.scrape_book_page(BASE_PATH + book.book_url)
    #puts  @books_array[input.to_i - 1]
    elsif input == "list"
      list_deals
    else
      puts "incorrect input, see prompt below"
    end
  end
end

  def goodbye
    puts "See you next week for more books!"
  end

end
