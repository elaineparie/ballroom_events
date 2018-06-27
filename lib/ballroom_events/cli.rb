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
#  rows = rows.slice(1)
    binding.pry
    rows.each do |info|
  url = "http://www.ndca.org#{info.css("a").attr("href").value}"
  scrape_event_url(url)
    #find event info using css
    #create new Event and assign attributes
  end
end

    def scrape_event_url(url)
      event_array = []
event_page = Nokogiri::HTML(open(url))
lines = event_page.css("div#center")
  event = BallroomEvents::Event.new
  event.name = lines.css("h3").text
  event.date = lines.css("h6").text.split(" at")[0]
  specific_info = lines.css("dl")
  event.contact_name = specific_info.css("dd")[0].text
  event.url = specific_info.css("dd")[1].text
  event.contact_number = specific_info.css("dd")[2].text
  event.contact_email = specific_info.css("dd")[4].text
  event.location = specific_info.css("dd")[5].text
  event_array << event
end




def list_events
binding.pry
  end


  def goodbye
      puts "Thanks for searching! See you at your next event."
      end


def location
  input = nil
  while input != "done"
    puts "Enter the name of the city you want to search or type 'all' to browse all events. Type 'done' to leave your search."
    input = gets.strip
    BallroomEvents::Event.find_by_name(input)
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
