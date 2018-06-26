require 'pry'
#CLI Controller
class BallroomEvents::CLI

  def call
    create_events
    list_events
    location
    goodbye
  end

def create_events
  page = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
  rows = page.css("tr")
  rows.each do |row|
   #date - row.css("td").children.first.text
   #url - row.css("a").attr("href").value - need to add ndca.org before the URL
   #location - 
    #find event info using css
    #create new Event and assign attributes
  binding.pry
  end
end

def list_events
  puts "Ballroom Events:"
  puts <<-DOC
  1. event 1
  2. event 2
  DOC

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
