#CLI Controller
class BallroomEvents::CLI

  def call
    list_events
    location
    goodbye
  end


def list_events
  puts "Ballroom Events:"
  @event = BallroomEvents::Event.all
  @event.each.with_index(1) do |event, i|
    puts "#{i}. #{event.name} - #{event.}"
  end

  @event = BallroomEvents::Event.all
  end

  def goodbye
      puts "Thanks for searching! See you at your next event."
      end


def location
  input = nil
  while input != "done"
    puts "Enter the name of the city you want to search or type 'all' to browse all events. Type 'done' to leave your search."
    input = gets.strip
    case input
  when "boston"
    puts "Boston events"
    specific_event
  when "new york"
    puts "New York Events"
   specific_event
  when "all"
    list_events
    end
  end
end

def specific_event
  puts "Enter the number of the event you want more information on or enter 'done' to go back to main menu."
  input = nil
  input = gets.strip.downcase
  if input == "1"
    puts "More info on event 1"
elsif input == "2"
    puts "More info on event 2"
  elsif input == "done"
  end

  end

end
