#CLI Controller
class BallroomEvents::CLI

  def call
    list_events
    location
    goodbye
  end


def list_events
  puts "Ballroom Events"
  puts <<-DOC
  1. event 1
  2. event 2
  DOC
end
end

def specific_event
  puts "Enter the number of the event you want more information on or enter 'done' to exit the search."
  input = nil
  while input != "done"
  input = gets.strip
  case input
  when "1"
    puts "More info on event 1"
  when "2"
    puts "More info on event 2"
    end
  end
end

def location
  puts "Enter the name of the city you want to search or type 'all' to browse all events. Type 'done' to leave your search."
  input = nil
  while input != "done"
    input = gets.strip
    case input
  when "boston"
    puts "Boston events"
    specific_event
  when "new york"
    puts "New York Events"
    specific_event
    goodbye
  when "all"
    list_events
    specific_event
    end
  end
end


def search_again
  puts "Do you want to search again? Type 'yes' to refresh search or 'done' to exit"
  input = gets.strip.downcase
  while input != "done"
   location
 end
end

def goodbye
    puts "Thanks for searching! See you at your next event."
end
