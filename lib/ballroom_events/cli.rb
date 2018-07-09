#CLI Controller
class BallroomEvents::CLI



    def call
      BallroomEvents::Scraper.create_events
      list_events
      specific_event
      goodbye
    end


  def list_events
    all_events = BallroomEvents::Event.all
    all_events.each.with_index do |event, index|
        puts "#{index}. #{event.date} - #{event.name} - #{event.location}"
    end
  end

  def goodbye
      puts "Thanks for searching! See you at your next event."
  end


  def specific_event
    # What to do if not valid
    # Don't scrape an event if already done
    puts "Enter the number of the event you want more information on, enter 'all' to see all events, or enter 'done' to exit search."
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i < BallroomEvents::Event.all.length
      event = BallroomEvents::Event.all[input.to_i - 1]
      BallroomEvents::Scraper.scrape_event(event)
      puts "Event Organizer: #{event.contact_name}, Organizer Phone: #{event.contact_number}, Organizer Email: #{event.contact_email}, Website: #{event.web}"
     specific_event
    elsif input == "all"
      list_events
     specific_event
    elsif input == "done"
    end
  end

end
