class MostReadBooks::Book
  attr_accessor :name, :author, :rating, :people_read, :book_url, :book_description

  @@all = []

  def initialize(book_hash)
   book_hash.each do |accessor, value|
      self.send("#{accessor}=", value)
      @@all<<self
    end
  end

  def self.create_from_collection(books_array)
    books_array.each do |book_hash|
      self.new(book_hash)
    end
  end

  def self.all
    @@all
  end
end
