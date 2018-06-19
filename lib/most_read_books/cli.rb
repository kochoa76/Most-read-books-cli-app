class MostReadBooks::CLI

  def call
    puts "Most Read Books This Week:"
    list_deals
    menu
    goodbye
  end

  def list_deals
    puts <<-DOC.gsub /^\s*/, ''
    1. "The Great Alone" - by "Kristin Hannah" - 4.35/ 5 rating - ready by: 3,407 people this week
    2. "Little Fires Everywhere" - by "Celeste Ng" - 4.16/5 rating - read by: 2,694 people this week
  DOC
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
