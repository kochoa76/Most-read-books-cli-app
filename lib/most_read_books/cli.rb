class MostReadBooks::CLI

  BASE_PATH = "https://www.goodreads.com"

  def call
    make_books
    list_books
    menu
    goodbye
  end

  def make_books #instantiates books from scrape method
    @books_array = MostReadBooks::BookScraper.scrape_main_page(BASE_PATH + "/book/most_read")
    MostReadBooks::Book.create_from_collection(@books_array)
  end

  def list_books #puts a hash of all books with properties
  puts ""
  puts "Welcome to this week's top 50 most read books! Scroll down to read the full list, and select an option"
  puts ""
    @books_array.each.with_index(1) do |book, i|
      book_name = book[:name]
      book_author = book[:author]
      book_rating = book[:rating]
      book_people_read = book[:people_read]
      puts "#{i}. #{book_name} by #{book_author} - #{book_rating} - this week#{book_people_read}"
    end
  end

  def choose_book(input) #selects one book from list, scrapes it and puts out it's description
   @urls_array = MostReadBooks::BookScraper.scrape_all_book_urls(BASE_PATH + "/book/most_read")
    book_description= MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + @urls_array[input.to_i-1] )
  end

  def menu
    input = ""
    while input != "exit"
    puts ""
    puts "  Options:  * Enter a book's respective number to read it's synopsis
            * Type list to see the list of books again
            * Type exit"
    input = gets.strip.downcase

    if input.to_i > 0 #when they call book number, print book number's synopsis but only that book's synopsis

      puts @books_array[input.to_i-1][:name]
      puts ""
      puts "Book Synopsis:"
      puts ""
      puts choose_book(input)

    elsif input == "list"
      list_books
    else
      puts "incorrect input, see prompt below" unless input == "exit"
    end
  end
end

  def goodbye
    puts "See you next week for more books!"
  end
end
