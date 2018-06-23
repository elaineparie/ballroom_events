require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  

  def self.scrape_page
  doc = Nokogiri::HTML(open(http://www.ndca.org/events/calendar/2018/))
end

end
