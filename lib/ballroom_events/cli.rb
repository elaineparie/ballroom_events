#CLI Controller
class BallroomEvents::CLI

  def call
    list_events
    location
    specific_event
  end


def list_events
  puts "Ballroom Events"
  puts <<-DOC
  1. event 1
  2. event 2
  DOC
end

def location
  puts "Enter the name of the city you want to search or type 'all' to browse all events"
  input = nil
  while input != "all", case statement
    input = gets.strip.downcase
    case input
  when input == "boston"
    puts "Boston events"
  when input == "new york"
    puts "New York Events"
  end 

end

def specific_event
  puts "Enter the number of the event you want more information on."
  input = gets.strip

end

end
