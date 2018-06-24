
class BallroomEvents::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.ndca.org/events/calendar/2018/"))
end

def scrape_page_index
  self.get_page.css(("tbody").children.css("a").attribute("href").value)
end

def make_event
  scrape_page_index.each do |e|
    BallroomEvents::Event.make_event
  end
 end

end
