require 'pry'
class BallroomEvents::Event

  attr_accessor :name, :location, :url, :contact_name, :contact_number, :contact_email

  def self.this_location

    #self.scrape_page
   #doc = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))


     #one event - doc.css("tbody").children.css("tr").first.text
     #date - doc.css("tbody").children.css("td").first.text
  #  url - doc.css("tbody").children.css("a").attribute("href").value - need to add ndca.org before the URL

  #end
    #should return events in a certain location
    puts <<-DOC
    1. event 1
    2. event 2
      DOC
      event_1 = self.new
      event_1.name = "name"
      event_1.location = "location"
      event_1.url = "url"
      event_1.contact = "contact_name"
      event_1.contact_number = "123-4567-8908"
      event_1.contact_email = "123@gmail.com"

      #returns multiple arrays of info
  end



end
