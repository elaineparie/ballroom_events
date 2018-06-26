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
  events_array = []
  page = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
  rows = page.css("tbody")
  rows.each do |row|
   date = row.css("td").children.first.text
   url = "http://www.ndca.org#{row.css("a").attr("href").value}" #- need to add ndca.org before the URL
    #find event info using css
    #create new Event and assign attributes
event_page = Nokogiri::HTML(open(url))
lines = event_page.css("div#center")
lines.each do |info|
  #name = info.css("h3").text
  specific_info = info.css("dl")
  specific_info.each do |single|
  contact_name = single.css("dd")[0].text
  event_url = single.css("dd")[1].text
  contact_number = single.css("dd")[2].text
  contact_email = single.css("dd")[4].text
  location = single.css("dd")[5].text




  binding.pry
end
end
  info
  binding.pry
binding.pry


#location
#events = {date: date,
#url: url}

#events_array << events
  end
end

def scrape_event_url(create_events)
#  event_page = "https://ndca.org#{create_events}"
  #binding.pry
  page = Nokogiri::HTML(open(create_events))
  binding.pry

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
