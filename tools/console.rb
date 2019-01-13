require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

lucy = Attendee.new("Lucy", 22)
katie = Attendee.new("Katie", 30)
kevin = Attendee.new("Kevin", 35)
david = Attendee.new("David", 35)

v1 = Venue.new("venue1", "here", 50)
v2 = Venue.new("venue2", "there", 40)

e1 = Event.new("event1", 10, 50, v1)
e2 = Event.new("event2", 10, 100, v2)

t1 = Ticket.new(katie, e1)
t2 = Ticket.new(kevin, e1)
t3 = Ticket.new(katie, e2)
t4 = Ticket.new(lucy, e1)







#The variable `lucy` will point to an instance of a new attendee

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
