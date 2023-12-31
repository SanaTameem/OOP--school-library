class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rentals(date, person)
    @rentals.push(Rental.new(date, self, person)) unless @rentals.include?(Rental.new(date, self, person))
  end

  def to_json(options = {})
    {
      title: @title,
      author: @author,
      rentals: @rentals
    }.to_json(options)
  end
end
