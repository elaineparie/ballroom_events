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
  rows = page.css("tbody")
  rows.each do |row|
  date = row.css("td").children.first.text
  url = "http://www.ndca.org#{row.css("a").attr("href").value}"

  scrape_event_url(url)
    #find event info using css
    #create new Event and assign attributes
  end
end

    def scrape_event_url(url)
      event_array = []
event_page = Nokogiri::HTML(open(url))
lines = event_page.css("div#center")
lines.each do |info|
  event = BallroomEvents::Event.new
  event.name = info.css("h3").text
  event.date = info.css("h6").text.split(" at")[0]
  specific_info = info.css("dl")
  specific_info.each do |single|
  event.contact_name = single.css("dd")[0].text
  event.url = single.css("dd")[1].text
  event.contact_number = single.css("dd")[2].text
  event.contact_email = single.css("dd")[4].text
  event.location = single.css("dd")[5].text
  event_array << event
  binding.pry
    end
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
