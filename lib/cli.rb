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


end
