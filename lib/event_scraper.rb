require 'nokogiri'
require 'open-uri'
require 'pry'

class Event_Scraper

  def self.scrape_library_page(library_url = "https://www.dclibrary.org/northeast#eventsTab")
    doc = Nokogiri::HTML(open(library_url))
    events_info = doc.css(".field-name-events-list").css(".view-content").css(".views-row")
    events = events_info.collect do |event_info|
      event = {
        name: event_info.css(".field-name-title").text,
        date: event_info.css(".date-display-single").text,
        url: event_info.css(".field-name-title").css("a").attribute("href").value
      }
    end
  end

  def self.scrape_event_page(event_url)
    doc = Nokogiri::HTML(open(event_url))
    event_info = {
      :description => doc.css(."field-name-body").text
    }
  end
end
