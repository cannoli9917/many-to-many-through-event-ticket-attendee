class Attendee

  attr_accessor :name, :age

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, age)
    @name = name
    @age = age

    @@all << self
  end

  def tickets
    Ticket.all.select do |tic|
      tic.attendee == self
    end
  end

  def events
    tickets.map do |tic|
      tic.event
    end
  end

  def money_spent
    events.reduce(0) do |sum, event|
      sum + event.tic_cost
    end
  end

end #end of Attendee class

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events
