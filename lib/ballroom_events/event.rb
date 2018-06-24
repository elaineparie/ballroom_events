require 'pry'
class BallroomEvents::Event

  attr_accessor :name, :location, :url, :contact_name, :contact_number, :contact_email

  def self.this_location

    #def self.scrape_page
    doc = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
    binding.pry

     doc.css("tbody").each do |event|
       td = event.css("td")
     end

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

  def self.scrape_page
  doc = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
  binding.pry
  end


end
