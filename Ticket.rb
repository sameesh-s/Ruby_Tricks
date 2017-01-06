class Ticket
  attr_reader :venue, :date
  attr_accessor  :price
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
  #defining a singleton method for class Ticket (Class is also an object), commonly known as class object
  def Ticket.max_price(*tickets)
    tickets.max_by(& :price)
  end
end

