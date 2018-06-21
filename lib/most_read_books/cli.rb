class MostReadBooks::CLI

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Most Read Books This Week:"
    @books = MostReadBooks::BookScraper
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.name} - #{book.author} - #{book.rating} - #{book.people_read}"
    end
  end

  def menu
    input =nil
    while input != "exit"
    puts "Enter the number of the book you would like more info on, or type list to see the list of books again, or type exit"
    input = gets.strip.downcase

    if input.to_i > 0
    puts  @books[input.to_i - 1]
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
