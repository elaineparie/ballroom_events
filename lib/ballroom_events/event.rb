class BallroomEvents::Event

  attr_accessor :name, :location, :contact_name, :contact_number, :contact_email, :url, :web, :date, :event_array

  @@all = []

  def initialize
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
