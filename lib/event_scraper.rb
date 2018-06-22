require 'nokogiri'
require 'open-uri'
require 'pry'

class Event_Scraper

#scrape event information from the library: event_title, event_time, event_description
  def self.scrape_library_page(library_url = "https://www.dclibrary.org/northeast")
    events = []
    doc = Nokogiri::HTML(open(library_url))
    events_info = doc.css(".group-right")
    events_info.each do |event_info|
      event = {
        name: doc.css(".field-name-title").text
        date: doc.css("date-display-single").text
        url: doc.css(".field-name-title").attribute("href").value
      }
    events << event
  end

  #library_url = "https://www.dclibrary.org/northeast"

  #also want to collect the entire description using the event url

end
