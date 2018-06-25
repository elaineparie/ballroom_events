class BallroomEvents::Event

  attr_accessor :name, :location, :contact_name, :contact_number, :contact_email, :url, :in, :tn, :mn, :fl, :ma, :tx, :ca, :nj, :ga, :md, :ut, :hi, :co, :ny, :az, :nc, :nv, :oh, :ct
  attr_accessor :la, :pa, :ia, :wi, :nh, :va, :or, :pa, :wa, :mo, :sc, :ky, :nm, :ne, :pr, 
  def self.all
    #returns all events

    event_1 = self.new
    event_1.name = "name"
    event_1.location = "location"
    event_1.contact_name = "name"
    event_1.contact_number = "number"
    event_1.url = "url"
    event_1.contact_email = "contact_email"

    [event_1]

  end


end
