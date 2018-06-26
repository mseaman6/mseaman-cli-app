require_relative "../lib/event_scraper.rb"
require_relative "../lib/event.rb"
require_relative "../lib/library.rb"
require 'nokogiri'
require 'open-uri'

class CLI
  Library_Url = "https://www.dclibrary.org/northeast#eventsTab"

  def run
    make_events
    add_event_description
    interface
  end

  def make_events
    events_array = Event_Scraper.scrape_library_page(Library_Url)
    Event.create_from_collection(events_array)
  end

  def add_event_description
    Event.all.each do |event|
      event_description = Event_Scraper.scrape_event_page("https://www.dclibrary.org" + event.url)
      event.add_event_attributes(event_description)
    end
  end

  def interface
    puts "Welcome to the DC Library event lister!"
    puts "To see a list of the upcoming events at the Northeast Library, enter 'events'."
    puts "To quit, please enter 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip.downcase
    if user_input == "events"
      Event.event_names
    else
      puts "I did not understand your selection.  Please try again."
      user_input = gets.strip.downcase until user_input == "exit"
    end
  end

end
