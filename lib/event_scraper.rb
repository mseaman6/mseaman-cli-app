require 'nokogiri'
require 'open-uri'
require 'pry'

class Event_Scraper

  attr_accessor :events
#scrape event information from the library: event_title, event_time, event_description
  def self.scrape_library_page(library_url = "https://www.dclibrary.org/northeast")
    doc = Nokogiri::HTML(open(library_url))
    events_info = doc.css(".view-content").css(".views-row")
    binding.pry
    events_info.collect do |event_info|
      event = {
        name: event_info.css(".field-name-title").text,
        date: event_info.css(".date-display-single").text,
        url: event_info.css(".field-name-title").css("a").attribute("href").value
      }
    end
  end

  #library_url = "https://www.dclibrary.org/northeast"

  #also want to collect the entire description using the event url

end
