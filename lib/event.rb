
class Event

  @@all = []
  attr_accessor :name, :date, :url, :description
#create event instance with various attributes

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

end
