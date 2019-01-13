class Event

  attr_accessor :name, :tic_cost, :event_cost, :venue

  @@all = []

  def self.all
    @@all
  end


  def initialize(name, tic_cost, event_cost, venue)
    @name = name
    @tic_cost = tic_cost
    @event_cost = event_cost
    @venue = venue

    @@all << self
  end

  def tickets
    Ticket.all.select do |tic|
      tic.event == self
    end
  end

  def total_from_tickets
    tickets.length * self.tic_cost
  end


  def sales_to_break_even
    remaining = self.event_cost - total_from_tickets
    if remaining > 0
      return remaining/self.tic_cost
    else
      return 0
    end
  end

  def tickets
    Ticket.all.select do |tic|
      tic.event == self
    end
  end

  def attendees
    tickets.map do |tic|
      tic.attendee
    end
  end

  def average_age
    total_age = attendees.reduce(0) do |sum, attendee|
        sum + attendee.age

    end

    total_age.to_f / attendees.length
  end



end #end of Event class

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0.
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
