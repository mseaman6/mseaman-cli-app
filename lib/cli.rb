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
    puts "Welcome to the DC Library event lister!"
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
    puts "To see a list of the upcoming events at the Northeast Library, enter 'events'."
    puts "To quit, please enter 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip.downcase
    if user_input == "events"
      Event.event_info
      get_event_details
      puts "Please feel free to make another selection."
      interface
    elsif user_input == "exit"
      exit
    else
      puts "I did not understand your selection.  Please try again."
      interface
    end
  end

  def get_event_details
    puts "For additional details on any of the listed events, please provide the number of the event. Otherwise, please enter 'exit'."
    user_input_2 = gets.strip
    Event.event_detail(user_input_2.to_i) unless user_input_2 == "exit"
  end
end
