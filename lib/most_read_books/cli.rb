class MostReadBooks::CLI

  BASE_PATH = "https://www.goodreads.com"

  def call
    list_books
    menu
    goodbye
  end

  def list_books
    puts ""
    puts "Welcome to this week's top 50 most read books! Scroll down to read the full list of books and their weekly ratings, and select an option below."
    puts ""
    MostReadBooks::Book.all.each.with_index(1) do |book, i|
    puts "#{i}. #{book.name} by #{book.author} - #{book.rating} - this week#{book.people_read}"
  end
end

  def menu
    input = ""
    while input != "exit"
    puts ""
    puts "  Options:  * Enter a book's respective number to read its synopsis
            * Type list to see the list of books again
            * Type exit"
    input = gets.strip.downcase

    if input.to_i > 0 #when they call book number, print book number's synopsis but only that book's synopsis

      # puts MostReadBooks::Book.all.name
      puts MostReadBooks::Book.find_name(input)
      puts ""
      puts "Book Synopsis:"
      puts ""
      puts MostReadBooks::Book.choose_book(input)

    elsif input == "list"
      list_books
    else
      puts "incorrect input, see prompt below" unless input == "exit"
    end
  end
end

  def goodbye
    puts ""
    puts "See you next week for more books!"
    puts ""
  end
end
