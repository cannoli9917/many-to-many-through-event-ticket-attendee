class Venue

  attr_accessor :name, :location, :rental_fee

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, location, rental_fee)
    @name = name
    @location = location
    @rental_fee = rental_fee

    @@all << self
  end

  def events
    Event.all.select do |ev|
      ev.venue == self
    end
  end

  def revenue
    events.length * self.rental_fee
  end

  def tickets
    all = events.map do |ev|
      ev.tickets
    end
    all.flatten
  end

  def attendees
    tickets.map do |tic|
      tic.attendee
    end
  end

  def guest_list
    list = {}
    events.each do |ev|
      list[ev.name] = ev.attendees
    end
    list
  end
end
