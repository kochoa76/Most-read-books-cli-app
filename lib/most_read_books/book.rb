class MostReadBooks::Book

  def self.weeks_books
    #should return instances of books
    puts <<-DOC.gsub /^\s*/, ''
    1. "The Great Alone" - by "Kristin Hannah" - 4.35/ 5 rating - read by: 3,407 people this week
    2. "Little Fires Everywhere" - by "Celeste Ng" - 4.16/5 rating - read by: 2,694 people this week
  DOC

end

end
