require 'pry'
#CLI Controller
class BallroomEvents::CLI



  def call
    create_events
    list_events
    specific_event
    goodbye
  end

def create_events
  page = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
  rows = page.css("tr")
  #remove placeholder row
  rows = rows.drop(1)
  rows.each do |info|
    if info.css("a").empty?
      next
    end

    url = "http://www.ndca.org#{info.css("a").attr("href").value}"
    scrape_event_url(url)
  end
end



def scrape_event_url(url)
  event_page = Nokogiri::HTML(open(url))
  lines = event_page.css("div#center")
  event = BallroomEvents::Event.new
  event.name = lines.css("h3").text
  event.date = lines.css("h6").text.split(" at")[0]

  specific_info = lines.css("dl")
  event.contact_name = specific_info.css("dd")[0].text
  event.web = specific_info.css("dd")[1].text
  event.contact_number = specific_info.css("dd")[2].text
  event.contact_email = specific_info.css("dd")[4].text
  event.location = specific_info.css("dd")[5].text
  event
end


def list_events
  all_events = BallroomEvents::Event.all
  all_events.each.with_index do |event, index|
    puts "#{index}. #{event.date} - #{event.name} - #{event.location}"
  end
end


  def goodbye
      puts "Thanks for searching! See you at your next event."
  end


  def specific_event
    puts "Enter the number of the event you want more information on or enter 'done' to exit search."
    input = gets.strip.downcase
    event = BallroomEvents::Event.all
    if input.to_i > 0
      event = event[input.to_i - 1]
      puts "Event Organizer: #{event.contact_name}, Organizer Phone: #{event.contact_number}, Organizer Email: #{event.contact_email}, Website: #{event.web}"
      specific_event
    elsif input == "all"
      list_events
      specific_event
    elsif input == "done"
    end
  end

end
