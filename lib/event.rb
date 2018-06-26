require 'colorize'

class Event

  @@all = []
  attr_accessor :name, :date, :url, :description

  def initialize(event_hash)
    event_hash.each do |k, v|
      self.send("#{k}=", v)
    end
    @@all << self
  end

  def self.create_from_collection(events_array)
    events_array.each do |event|
      Event.new(event)
    end
  end

  def add_event_attributes(attributes_hash)
    attributes_hash.each do |k, v|
      self.send("#{k}=", v)
    end
    self
  end

  def self.all
    @@all
  end

  def self.event_list
    self.all.each.with_index(1) do |event, index|
      if event.date == nil
        puts "#{index}. #{event.name}"
      else
        puts "#{index}. #{event.name}, #{event.date}"
      end
    end
  end

  def self.event_detail(input)
    puts ""
    puts "#{input}. #{self.all[input - 1].name}, #{self.all[input - 1].date}".colorize(:green)
    puts ""
    puts "#{self.all[input - 1].description}".colorize(:light_blue)
    puts ""
  end
end
