require_relative "../lib/event_scraper.rb"
require_relative "../lib/event.rb"
require_relative "../lib/library.rb"
require 'nokogiri'
require 'open-uri'

class CLI

  def run
    make_events
  end

  def make_events
    events_array = Event_Scraper.scrape_library_page
    Event.create_from_collection(events_array)
  end

  def add_event_description
    Event.all.each do |event|
      event_description = Event_Scraper.scrape_event_page(library_url + event.url)
      event.add_event_attributes(attributes_hash)
    end
  end
end
