class BallroomEvents::Event

  attr_accessor :name, :location, :contact_name, :contact_number, :contact_email, :url, :date, :event_array


  @@all = []

def initialize
#  @name = name
  @@all << self

end

  def self.all
    #returns all events

    @@all
  end
end
