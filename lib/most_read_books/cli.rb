class MostReadBooks::CLI

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts "Most Read Books This Week:"
    @books = MostReadBooks::Book.weeks_books
  end

  def menu
    input =nil
    while input != "exit"
    puts "Enter the number of the book you would like more info on, or type list to see the list of books again, or type exit"
    input = gets.strip.downcase
    case input
    when "1"
      puts "info on book 1"
    when "2"
      puts "info on book 2"
    when "list"
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
