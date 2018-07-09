
class BallroomEvents::Scraper

  def self.create_events
    page = Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
    rows = page.css("tr")
    #remove placeholder row
    rows = rows.drop(1)
    rows.each do |info|
      if info.css("a").empty?
        next
      end
      event = BallroomEvents::Event.new
     event.name = info.css("a").text
     event.date = info.css("td").children[0].text
    event.url = "http://www.ndca.org#{info.css("a").attr("href").value}"

    #  self.scrape_event_url(url)
    end
  end

  def self.scrape_event(event)
    event_page = Nokogiri::HTML(open(event.url))
    lines = event_page.css("div#center")

    specific_info = lines.css("dl")
    event.contact_name = specific_info.css("dd")[0].text
    event.web = specific_info.css("dd")[1].text
    event.contact_number = specific_info.css("dd")[2].text
    event.contact_email = specific_info.css("dd")[4].text
    event.location = specific_info.css("dd")[5].text
    event
  end

end
