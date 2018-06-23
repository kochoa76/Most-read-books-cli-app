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
  puts "Most Read Books This Week:"
    @books_array.each.with_index(1) do |book, i|
      book_name = book[:name]
      book_author = book[:author]
      book_rating = book[:rating]
      book_people_read = book[:people_read]
      puts "#{i}. #{book_name} - #{book_author} - #{book_rating} - #{book_people_read}"
    end
  end

    def choose_book(index)
       @urls_array = MostReadBooks::BookScraper.scrape_all_book_urls(BASE_PATH + "/book/most_read")
       book_description= MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + @urls_array[index] )
     end

     def input_to_index(user_input)
       user_input.to_i - 1
     end

    # def add_description(index) #scrapes book page and adds book description to appropriate book
    #     #@urls_array = MostReadBooks::BookScraper.scrape_all_book_urls(BASE_PATH + "/book/most_read")
    #
    #     book_description= MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + @urls_array[index] )
    #     binding.pry
    #     # book.book_description = @book_description_array
    #     #MostReadBooks::Book.add_book_description(book_description)
    #     #book.MostReadBooks::BookScraper.add_book_description(description)
    # end

  # def add_description #scrapes book page and adds book description to appropriate book
  #   MostReadBooks::Book.all.each do |book|
  #     @book_description_array = MostReadBooks::BookScraper.scrape_book_page(BASE_PATH + book.book_url)
  #     # book.book_description = @book_description_array
  #     book.add_book_description(@book_description_array)
  #     #book.MostReadBooks::BookScraper.add_book_description(description)
  #   end
  # end

      # MostReadBooks::BookScraper.scrape_book_page(book_url).each do |book|
      #   book.add_book_description()

  def menu
    input =nil
    while input != "exit"
    puts "Enter the number of the book you would like more info on, or type list to see the list of books again, or type exit"
    input = gets.strip.downcase


    if input.to_i > 0 #when they call book number, print book number's synopsis but only that book's synopsis
    choose_book(input.to_i-1)

    elsif input == "list"
      list_books
    else
      puts "incorrect input, see prompt below"
    end
  end
end

  def goodbye
    puts "See you next week for more books!"
  end

end
