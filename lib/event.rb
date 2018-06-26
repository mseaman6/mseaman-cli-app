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

  def self.event_info
    self.all.each.with_index(1) do |event, index|
      puts "#{index}. #{event.name}, #{event.date}"
    end
  end

  def self.event_detail(input)
    puts "#{self.all[input - 1].description}"
  end
end
