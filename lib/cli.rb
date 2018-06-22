require_relative "../lib/event_scraper.rb"
require_relative "../lib/event.rb"
require_relative "../lib/library.rb"
require 'nokogiri'
require 'open-uri'

class CLI
  library_url = "https://www.dclibrary.org/northeast#eventsTab"

  def run
    make_events
    add_event_description
  end

  def make_events
    events_array = Event_Scraper.scrape_library_page(library_url)
    Event.create_from_collection(events_array)
  end

  def add_event_description
    Event.all.each do |event|
      event_description = Event_Scraper.scrape_event_page(library_url + event.url)
      event.add_event_attributes(event_description)
    end
  end
end
